#!/bin/bash

# Ask user for domain
read -p "Enter the target domain: " DOMAIN

# Ask if the user wants to scan IPs
read -p "Do you want to scan the IPs? (y/n): " SCAN_IPS

# Ask if the user wants to perform SSRF testing
read -p "Do you want to perform SSRF testing? (y/n): " response
if [[ "$response" != "y" ]]; then
    echo "SSRF testing skipped."
else
    # Ask for the Burp Collaborator link
    read -p "Enter your Burp Collaborator link: " burp_link

    # Ensure the Burp Collaborator link starts with http:// or https://
    if [[ ! "$burp_link" =~ ^https?:// ]]; then
        burp_link="http://$burp_link"
        echo "[*] Scheme not provided. Using: $burp_link"
    fi
fi

# Ask if the user wants directory brute-forcing
read -p "Do you want directory brute-forcing? (y/n): " DIRBRUTE

figlet Reconing Started | lolcat
# Create root directory with the domain name
ROOT_DIR="./$DOMAIN"
mkdir -p "$ROOT_DIR"

# Create necessary subdirectories
SUBDOMAINS_DIR="$ROOT_DIR/subdomains"
IPS_DIR="$ROOT_DIR/ips"
URLS_DIR="$ROOT_DIR/urls"
DIRBRUTE_DIR="$ROOT_DIR/dirbruteforce"

mkdir -p "$SUBDOMAINS_DIR" "$IPS_DIR" "$URLS_DIR" "$DIRBRUTE_DIR" 

# Subdomain Enumeration
echo "[*] Gathering subdomains..."
assetfinder "$DOMAIN" | anew "$SUBDOMAINS_DIR/asrt.txt"
subfinder -d "$DOMAIN" -all -o "$SUBDOMAINS_DIR/sub.txt"
findomain -t "$DOMAIN" -u "$SUBDOMAINS_DIR/find.txt"
curl -s "https://crt.sh/?q=%.$DOMAIN&output=json" | jq -r '.[].name_value' | sort -u > "$SUBDOMAINS_DIR/crt.txt"

# Combine and sort all subdomains
cat "$SUBDOMAINS_DIR/"* | anew "$SUBDOMAINS_DIR/finalsubdomains.txt"
SUB_COUNT=$(wc -l < "$SUBDOMAINS_DIR/finalsubdomains.txt")
echo "[*] Total subdomains found: $SUB_COUNT"

# Clean up extra subdomain files
rm -f "$SUBDOMAINS_DIR/asrt.txt" "$SUBDOMAINS_DIR/crt.txt"  "$SUBDOMAINS_DIR/sub.txt" "$SUBDOMAINS_DIR/find.txt"

# Filter working subdomains
cat "$SUBDOMAINS_DIR/finalsubdomains.txt" | httpx -silent -o "$SUBDOMAINS_DIR/validsub.txt"
rm -f "$SUBDOMAINS_DIR/finalsubdomains.txt"

# IP Scanning
if [[ "$SCAN_IPS" == "y" ]]; then
    figlet Ip scanning | lolcat
    echo "[*] Collecting IP addresses..."
    cat "$SUBDOMAINS_DIR/validsub.txt" | httpx -ip -silent -o "$IPS_DIR/dmnip.txt"
    grep -Eo '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' "$IPS_DIR/dmnip.txt" > "$IPS_DIR/ip.txt"
    cat "$IPS_DIR/ip.txt" | httpx -silent -o "$IPS_DIR/validip.txt"
    grep -Eo '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' "$IPS_DIR/validip.txt" > "$IPS_DIR/final_ip.txt"

    # Scanning with masscan and nmap
    echo "[*] Scanning for open ports with masscan..."
    sudo masscan -p1-65535 -iL "$IPS_DIR/final_ip.txt" -oL "$IPS_DIR/masscan.txt"
    awk '{ print $4 }' "$IPS_DIR/masscan.txt" | sort -u > "$IPS_DIR/nmap.txt"
    sudo nmap -Pn -iL "$IPS_DIR/nmap.txt" -oX "$IPS_DIR/nout.xml"
    xsltproc "$IPS_DIR/nout.xml" -o "$IPS_DIR/nout.html"
    rm -rf "$IPS_DIR/dmnip.txt" "$IPS_DIR/ip.txt"

else
    echo "[*] Skipping IP scanning..."
fi

figlet Gathering Urls| lolcat
# URL Gathering
echo "[*] Gathering URLs..."
gau "$DOMAIN" | anew "$URLS_DIR/gau.txt"
cat "$SUBDOMAINS_DIR/validsub.txt" | waybackurls | anew "$URLS_DIR/wayback.txt"
katana -u "$DOMAIN" -jc -d 5 -o "$URLS_DIR/katana.txt"
subjs -i "$SUBDOMAINS_DIR/validsub.txt" | anew "$URLS_DIR/subjs.txt"
cat "$URLS_DIR/"* | anew "$URLS_DIR/uniqurl.txt"
rm -rf "$URLS_DIR/gau.txt" "$URLS_DIR/wayback.txt" "$URLS_DIR/katana.txt" "$URLS_DIR/subjs.txt"

# Gather JavaScript files
cat "$URLS_DIR/uniqurl.txt" | grep "\.js$" | anew "$URLS_DIR/js_file.txt"

# Gather potential SSRF URLs if SSRF testing is enabled
if [[ "$response" == "y" && -s "$URLS_DIR/ssrf1.txt" ]]; then
    figlet Finding SSRF | lolcat
    cat "$URLS_DIR/ssrf1.txt" | qsreplace "$burp_link" | xargs -I % -P 25 sh -c '
        response=$(curl -kLs -w "%{http_code} %{url_effective} %{redirect_url}" "%" 2>&1)
        if echo "$response" | grep -Eq "(10\..|172\.(1[6-9]|2[0-9]|3[01])\..|192\.168\..|localhost|127\.0\.0\.1|::1|169\.254\..|metadata|Forbidden|Access Denied|Error)"; then
            echo "Potential SSRF VULN! %"
            echo "$response" >> '"$URLS_DIR/ssrf_result.txt"'
        fi
    '
    cat "$URLS_DIR/uniqurl.txt" | grep "=" | qsreplace "$burp_link" > "$URLS_DIR/ssrf2.txt"
    cat "$URLS_DIR/ssrf2.txt" | httpx -fr -o "$URLS_DIR/httpx_ssrf_results.txt"
    echo "SSRF testing completed. Results saved in $URLS_DIR."
else
    echo "No SSRF candidates found or SSRF testing was skipped."
fi

# Directory Brute-forcing
if [[ "$DIRBRUTE" == "y" ]]; then
    figlet Subdomain BruteForcing | lolcat
    echo "[*] Performing directory brute-forcing with gobuster..."
    gobuster dir -u "http://$DOMAIN" -w "/usr/share/SecLists/Discovery/Web-Content/common.txt" | anew "$DIRBRUTE_DIR/gobuster.txt"

    echo "[*] Performing directory brute-forcing with ffuf..."
    ffuf -w "/usr/share/SecLists/Discovery/Web-Content/common.txt" -u "https://FUZZ.$DOMAIN" -c -t 500 -mc 200,404,302 | anew "$DIRBRUTE_DIR/ffuf.txt"
else
    echo "[*] Skipping directory brute-forcing..."
fi

echo "[*] Recon completed successfully."
