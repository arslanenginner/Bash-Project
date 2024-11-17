
# Recon Tool 🕵️‍♂️

This **Recon Tool** is a comprehensive network reconnaissance script built for gathering domain information, subdomain enumeration, IP scanning, SSRF testing, URL collection, and directory brute-forcing. It’s designed to streamline the process of performing a recon for penetration testing, bug bounty hunting, or just general network assessment.

---

## 🚀 Features:
- **Domain Recon**: Gather information about a target domain and its subdomains.
- **Subdomain Enumeration**: Use popular tools like `assetfinder`, `subfinder`, `findomain`, and `crt.sh` to discover subdomains.
- **IP Scanning**: Collect IP addresses for valid subdomains and scan them using `masscan` and `nmap` for open ports.
- **SSRF Testing**: Automatically test for SSRF vulnerabilities by interacting with a Burp Collaborator link.
- **URL Gathering**: Collect URLs from subdomains using tools like `gau`, `waybackurls`, `katana`, and `subjs`.
- **Directory Brute-Forcing**: Use `gobuster` and `ffuf` for directory brute-forcing with a common wordlist.

---

## ⚡ Installation

### Prerequisites:
Make sure you have the following tools installed:
- **Assetfinder**
- **Subfinder**
- **Findomain**
- **Crt.sh**
- **Httpx**
- **Masscan**
- **Nmap**
- **Xsltproc**
- **Gobuster**
- **FFUF**
- **Gau**
- **Waybackurls**
- **Katana**
- **Subjs**
- **Qsreplace** (For SSRF testing)

### 1. Clone the Repository:

```bash
git clone https://github.com/arslanenginner/Bash-Project.git
cd Bash-Project/recon-Tool
```
2. Install Dependencies:
Install the required tools listed above using your package manager or the tool’s installation guides.

For example, on Ubuntu:
```bash
sudo apt install assetfinder subfinder findomain httpx masscan
```
🧑‍💻 Usage
Make the script executable:
```
chmod +x recon.sh
```
Run the Script:
```
sudo ./recon.sh
```

## 🧑‍💻 Script Input Prompts

The script will ask you for the following:

- **Target Domain**: The domain to perform reconnaissance on.
- **IP Scan**: Whether you want to scan IPs for valid subdomains.
- **SSRF Testing**: Whether you want to perform SSRF testing using Burp Collaborator.
- **Directory Brute-Forcing**: Whether you want to brute-force directories using **gobuster** or **ffuf**.

---

## 💡 Example Steps

1. **Enter your target domain** (e.g., `example.com`).
2. **Decide whether you want to scan IPs**:
   - If you choose "yes", the script will scan valid subdomains and perform IP address discovery.
3. **SSRF Testing**:
   - If you choose to perform SSRF testing, provide your **Burp Collaborator link**. The tool will attempt to exploit potential SSRF vulnerabilities by making requests to internal IP ranges.
4. **Directory Brute-Forcing**:
   - You can enable directory brute-forcing with either **gobuster** or **ffuf**.

---

## 🗂 Example Directory Structure

After running the script, it will create a directory structure like this:

```plaintext
./example.com/
├── dirbruteforce/
├── ips/
├── subdomains/
└── urls/
```
```bash
sudo ./recon.sh
```
Enter the target domain: example.com
. Select if you want to scan IPs: y or n
. Select if you want to perform SSRF testing: y or n
. Select if you want to perform directory brute-forcing: y or n


2. What Happens in the Background:
* Subdomain Enumeration: The script will use multiple tools (e.g., assetfinder, subfinder, findomain, crt.sh) to discover subdomains of the target domain.
* IP Scanning: If enabled, the script will gather the IP addresses for valid subdomains and scan them for open ports using masscan and nmap.
* SSRF Testing: If enabled, the script will check for potential SSRF vulnerabilities by replacing parameters with your Burp Collaborator link and testing for vulnerabilities.
* URL Gathering: The script will collect URLs using tools like gau, waybackurls, katana, and subjs.
* Directory Brute-Forcing: The script will perform directory brute-forcing with gobuster and ffuf using a common wordlist.

🗂 Example Folder Structure After Running the Script:
```bash
./example.com/
├── dirbruteforce/
│   ├── gobuster.txt
│   └── ffuf.txt
├── ips/
│   ├── final_ip.txt
│   ├── masscan.txt
│   ├── nout.xml
│   └── nout.html
├── subdomains/
│   ├── finalsubdomains.txt
│   └── validsub.txt
└── urls/
    ├── uniqurl.txt
    ├── js_file.txt
    ├── ssrf_result.txt
    └── httpx_ssrf_results.txt
```

📝 Notes
* Burp Collaborator: For SSRF testing, make sure you have an active Burp Collaborator link. You can create one at Burp Suite.
* Masscan & Nmap: The script uses masscan for initial port scanning and nmap for detailed service/version scans.














