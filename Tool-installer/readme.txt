
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>M@lware Tool Installation Script</title>
</head>
<body>
    <h1>M@lware Tool Installation Script</h1>
    <p>This is a bash script to automate the setup of various penetration testing and security tools on a Debian-based system (e.g., Ubuntu). It installs a set of essential tools for OSINT, vulnerability scanning, information gathering, and more.</p>
    
    <h2>Table of Contents</h2>
    <ul>
        <li><a href="#overview">Overview</a></li>
        <li><a href="#features">Features</a></li>
        <li><a href="#requirements">Requirements</a></li>
        <li><a href="#usage">Usage</a></li>
        <li><a href="#tools-installed">Tools Installed</a></li>
        <li><a href="#customization">Customization</a></li>
        <li><a href="#contributing">Contributing</a></li>
    </ul>

    <h2 id="overview">Overview</h2>
    <p>The M@lware installation script sets up a powerful collection of tools for penetration testing, web application security, vulnerability assessment, and more. It installs tools via APT, Snap, Go, and directly from GitHub repositories. The script is designed to quickly configure a pentesting environment, making it ideal for bug bounty hunters, security researchers, and ethical hackers.</p>

    <h2 id="features">Features</h2>
    <ul>
        <li><strong>System Update:</strong> Updates the system and installs essential packages.</li>
        <li><strong>Tool Installation:</strong> Installs numerous tools for web application security, network scanning, and OSINT.</li>
        <li><strong>Go & Python Tools:</strong> Installs Go-based and Python-based tools.</li>
        <li><strong>GitHub Repositories:</strong> Clones essential tools from GitHub for advanced functionality.</li>
        <li><strong>Additional Configuration:</strong> Downloads, builds, and installs additional binaries like Subzy and Findomain.</li>
    </ul>

    <h2 id="requirements">Requirements</h2>
    <p>Before running the script, ensure you have the following:</p>
    <ul>
        <li>A Debian-based Linux distribution (Ubuntu, Kali, etc.).</li>
        <li>Sudo privileges for installing packages and setting up tools.</li>
        <li>The figlet and lolcat utilities for fun ASCII art output (optional but included in the script).</li>
    </ul>

    <h2 id="usage">Usage</h2>
    <h3>1. Download the Script:</h3>
    <pre><code>git clone https://github.com/arslanenginner/Bash-Project.git
cd Bash-Project/Tool-installer/</code></pre>

    <h3>2. Make the Script Executable:</h3>
    <p>Ensure the script is executable by running:</p>
    <pre><code>chmod +x tool_install.sh</code></pre>

    <h3>3. Run the Script:</h3>
    <p>Execute the script with sudo privileges:</p>
    <pre><code>sudo ./tool_install.sh</code></pre>
    <p>This will automatically update the system, install necessary dependencies, and set up the tools.</p>

    <h3>4. Enjoy:</h3>
    <p>Once the script completes, you will have a fully configured setup with various penetration testing and OSINT tools.</p>

    <h2 id="tools-installed">Tools Installed</h2>
    <p>The script installs a variety of tools, including but not limited to:</p>
    
    <h3>Web & Network Tools:</h3>
    <ul>
        <li>nmap, massdns, httpx, subfinder, assetfinder, waybackurls, gf</li>
        <li>findomain, dirsearch, lazyrecon, wpscan</li>
    </ul>

    <h3>Python Tools:</h3>
    <ul>
        <li>eyewitness, py-altdns, charset-normalizer, jsbeautifier</li>
    </ul>

    <h3>Go Tools:</h3>
    <ul>
        <li>anew, qsreplace, katana, nuclei, shuffledns, gf</li>
    </ul>

    <h3>GitHub Repositories:</h3>
    <ul>
        <li>SecretFinder, Zphisher, Subzy, Sniper, OneForAll, Bug-Bounty-Search-Engine</li>
        <li>GitDorker, ParamSpider, Burpsuite-Professional, Sn1per, Gopherus</li>
    </ul>

    <p>Additionally, the script installs some fun tools like figlet and lolcat for ASCII output.</p>

</body>
</html>
