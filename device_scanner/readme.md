# Device Scanner Tool 🛠️

A simple yet powerful bash script that allows you to scan network targets using **Nmap** or **Naabu**. This tool enables the user to perform different scan types, choose specific ports, and save results in both `.xml` and `.html` formats for easy analysis. It’s perfect for penetration testers, network administrators, or anyone interested in network scanning and vulnerability assessment.

## 🚀 Features:
- **Scan with Nmap or Naabu** 🌐
- **Supports Single Target or File Input** 📄
- **Customizable Scans**: Normal, Advanced, Specific Ports, and more ⚙️
- **Detailed Output**: Results in both `.xml` and `.html` format 📊
- **Nmap Scripting**: Ability to apply Nmap's default or custom scripts 📝
- **Adjustable Timing**: Choose a scan speed/timing template 🕑

## ⚡ Installation

To get started, clone the repository and install the necessary dependencies:

### 1. Clone the Repository:

```bash
git clone https://github.com/arslanenginner/Bash-Project
cd Bash-Project/device_scanner/
```
2. Install Required Dependencies:
This script requires nmap, naabu, and xsltproc (for converting .xml to .html). To install these dependencies, run:
```bash
sudo apt update
sudo apt install figlet nmap naabu xsltproc
```
🖥️ Usage
After installing the dependencies, you can use the script with the following steps:

1. Run the Script:
```bash
chmod +x device_scanner.sh
sudo ./device_scanner.sh
```
2. Follow the Prompts:
The script will guide you through the scanning process with several options:

Choose Scan Tool: Select between nmap or naabu.
Target Type: Choose whether to scan a single target or scan from a file.
Scan Type: Select between Normal or Advanced scan.
Port Options: Customize the ports to scan (all or specific ports).
Nmap Scripting: Option to run default or custom Nmap scripts.
3. View Results:
Once the scan completes, you will receive two output files:

nmap.xml: Raw Nmap scan result.
nmap.html: Beautifully formatted HTML result for easier viewing.

💡 Example Usage
Scan a Single Target with Nmap:

Select nmap
Choose single for the target type
Enter a target IP or hostname (e.g., 10.10.1.1)
Select the desired scan options

Scan a List of Targets with Naabu:
Select naabu
Choose file for the target type
Provide a text file with a list of IPs or hostnames
Specify port options (e.g., 80,443,8080)
