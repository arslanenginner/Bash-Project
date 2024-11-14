# Tool Installation Script by M@lware 

This is a bash script to automate the setup of various penetration testing and security tools on a Debian-based system 
  (e.g., Ubuntu). It installs a set of essential tools for OSINT, vulnerability scanning, information gathering, and more.


## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Usage](#usage)
- [Tools Installed](#tools-installed)

## Overview

The M@lware installation script sets up a powerful collection of tools for penetration testing, web application security, vulnerability assessment, and more. It installs tools via APT, Snap, Go, and directly from GitHub repositories. The script is designed to quickly configure a pentesting environment, making it ideal for bug bounty hunters, security researchers, and ethical hackers.

## Features

- **System Update:** Updates the system and installs essential packages.
- **Tool Installation:** Installs numerous tools for web application security, network scanning, and OSINT.
- **Go & Python Tools:** Installs Go-based and Python-based tools.
- **GitHub Repositories:** Clones essential tools from GitHub for advanced functionality.
- **Additional Configuration:** Downloads, builds, and installs additional binaries like Subzy and Findomain.

## Requirements

Before running the script, ensure you have the following:

- A Debian-based Linux distribution (Ubuntu, Kali, etc.).
- Sudo privileges for installing packages and setting up tools.
- The `figlet` and `lolcat` utilities for fun ASCII art output (optional but included in the script).

## Usage

### 1. Download the Script

```bash
git clone https://github.com/arslanenginner/Bash-Project.git
cd Bash-Project/Tool-installer/

```
2. Make the Script Executable
Ensure the script is executable by running:
```bash
chmod +x tool_install.sh
```
3. Run the Script
Execute the script with sudo privileges:
```bash
sudo ./tool_install.sh
```
This will automatically update the system, install necessary dependencies, and set up the tools.

### 4. Enjoy

Once the script completes, you will have a fully configured setup with various penetration testing and OSINT tools.

## Tools Installed

The script installs a variety of tools, including but not limited to:

### Web & Network Tools

- `nmap`, `massdns`, `httpx`, `subfinder`, `assetfinder`, `waybackurls`, `gf`
- `findomain`, `dirsearch`, `lazyrecon`, `wpscan`

### Python Tools

- `eyewitness`, `py-altdns`, `charset-normalizer`, `jsbeautifier`

### Go Tools

- `anew`, `qsreplace`, `katana`, `nuclei`, `shuffledns`, `gf`

### GitHub Repositories

- `SecretFinder`, `Zphisher`, `Subzy`, `Sniper`, `OneForAll`, `Bug-Bounty-Search-Engine`
- `GitDorker`, `ParamSpider`, `Burpsuite-Professional`, `Sn1per`, `Gopherus`

Additionally, the script installs some fun tools like **figlet** and **lolcat** for ASCII output.

## Customization

Feel free to customize the script for your specific needs. You can add or remove tools, modify installation steps, or tweak configurations as required. For advanced users, you can fork the repository and submit your changes.
