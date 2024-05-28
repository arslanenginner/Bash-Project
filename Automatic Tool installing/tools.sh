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

# Install Sublist3r
echo "Installing Sublist3r"
sudo apt-get install -y sublist3r

# Install Golang
echo "Installing Golang"
sudo apt install -y golang

# Install Eyewitness
echo "Installing Eyewitness"
sudo apt install -y eyewitness

# Install Zphisher
echo "Installing Zphisher"
git clone https://github.com/htr-tech/zphisher.git
cd zphisher
chmod +x zphisher.sh
cd ..

# Install Subzy
echo "Installing Subzy"
git clone https://github.com/LukaSikic/subzy.git
cd subzy
go build main.go
mv main subzy
sudo cp subzy /usr/bin/
cd ..

# Install Findomain
echo "Installing Findomain"
curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
unzip findomain-linux.zip
chmod +x findomain
sudo mv findomain /usr/bin/findomain

# Install gf
echo "Installing gf"
git clone https://github.com/tomnomnom/gf.git
cd gf
go build main.go
mv gf /usr/bin/gf
sudo cp gf /usr/bin/
cd ~/Tools

# Install Sniper
echo "Installing Sniper"
git clone https://github.com/1N3/Sn1per.git
cd Sn1per
cd ..

# Install Anew
echo "Installing Anew"
git clone https://github.com/tomnomnom/anew.git
cd anew
go build
mv anew /usr/bin/
sudo cp anew /usr/bin/
cd ..

# Install Httprobe
echo "Installing Httprobe"
sudo apt install -y httprobe

# Install Ffuf
echo "Installing Ffuf"
git clone https://github.com/ffuf/ffuf.git
cd ffuf
go get
go build
sudo cp ffuf /usr/bin/
cd ..

# Install Httpx
echo "Installing Httpx"
sudo apt install -y snapd
sudo systemctl enable --now snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install httpx

