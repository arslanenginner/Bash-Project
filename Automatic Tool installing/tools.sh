#!/bin/bash

echo " "
echo "            *** Created By M@lware ***    "
echo " "

# Update and upgrade the system
sudo apt update -y
sudo apt upgrade -y
# Create a directory for tools
mkdir -p ~/Tools
cd ~/Tools

echo "----------------------------------------------"

echo "Installing Sublist3r"
sudo apt-get install -y sublist3r

echo "----------------------------------------------"

echo "Installing Golang"
sudo apt install -y golang

echo "----------------------------------------------"

echo "Installing Eyewitness"
sudo apt install -y eyewitness

echo "----------------------------------------------"

echo "Installing Zphisher"
git clone https://github.com/htr-tech/zphisher.git
cd zphisher
chmod +x zphisher.sh
cd ..

echo "----------------------------------------------"

echo "Installing Subzy"
git clone https://github.com/LukaSikic/subzy.git
cd subzy
go build main.go
mv main subzy
sudo cp subzy /usr/bin/
cd ..

echo "----------------------------------------------"

echo "Installing Findomain"
cd ~/Tools
curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
unzip findomain-linux.zip
chmod +x findomain
sudo mv findomain /usr/bin/findomain

echo "----------------------------------------------"

echo "Installing gf"
git clone https://github.com/tomnomnom/gf.git
cd gf
go build main.go
mv main gf
sudo cp gf /usr/bin
cd ~/Tools

echo "----------------------------------------------"

echo "Installing Sniper"
git clone https://github.com/1N3/Sn1per.git
cd Sn1per
cd ..

echo "----------------------------------------------"

echo "Installing Anew"
git clone https://github.com/tomnomnom/anew.git
cd anew
go build
mv anew /usr/bin/
sudo cp anew /usr/bin/
cd ..

echo "----------------------------------------------"

echo "Installing Httprobe"
sudo apt install -y httprobe

echo "----------------------------------------------"

echo "Installing Ffuf"
git clone https://github.com/ffuf/ffuf.git
cd ffuf
go get
go build
sudo cp ffuf /usr/bin/
cd ..

echo "----------------------------------------------"

echo "Installing Httpx"
sudo apt install -y snapd
sudo systemctl enable --now snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install httpx

echo "----------------------------------------------"

echo "Installing CyberPunker"
git clone https://github.com/muhamma-ibrahim/cyberpunk.git
chmod +x cyberpunk

echo "----------------------------------------------"

echo "Installing Google Dorking Tool"
git clone https://github.com/NitinYadav00/Bug-Bounty-Search-Engine.git
chmod +x Bug-Bounty-Search-Engine

echo "----------------------------------------------"

echo "Installing Seclists"
sudo apt install seclists

echo "----------------------------------------------"

echo "Installing asnmap"
git clone https://github.com/projectdiscovery/asnmap
cd asnmap/cmd/asnmap
go build

echo "----------------------------------------------"

echo "Installing assetfinder"
go install github.com/tomnomnom/assetfinder@latest

echo "----------------------------------------------"

echo "Installing Google"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install

echo "----------------------------------------------"

echo "Installing Tor"
sudo apt install -y tor torbrowser-launcher

echo "----------------------------------------------"

echo "Installing Discord"
wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
sudo dpkg -i discord.deb

echo "----------------------------------------------"

echo "Installing Crt.sh"
git clone https://github.com/tdubs/crt.sh.git
chmod +x crt.sh

echo "----------------------------------------------"

echo "Installing Subfinder"
sudo apt install subfinder

echo "----------------------------------------------"

echo "Installing Vlc"
sudo apt install vlc

echo "----------------------------------------------"

echo "Installing Konsole Terminal"
sudo apt install konsole

echo "----------------------------------------------"

echo "Installing Kazam"
sudo apt install kazam

echo "----------------------------------------------"

echo "Installing OBS studio"
sudo apt install obs-studio

echo "----------------------------------------------"

echo "Installing Brupsuite"
git clone https://github.com/raystyle/BurpSuite_Pro_v1.7.32.git

echo "----------------------------------------------"

echo "Installing Naabu"
sudo apt install naabu



echo "                *-*-*.Thanks.*-*-*   "
