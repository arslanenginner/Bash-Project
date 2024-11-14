#!/bin/bash

echo -e "\e[38;5;27m$(figlet 'M@lware')\e[0m"

# System Update and Basic Setup
sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y 
sudo apt install -y snap python3-pip pipx golang unzip figlet lolcat nmap massdns \
  konsole kazam tor torbrowser-launcher subfinder git

# Create Tools Directory
mkdir -p ~/Tools && cd ~/Tools

echo "----------------------------------------------"

# Install tools via Snap and APT
sudo snap install chromium seclists
pip install --upgrade charset-normalizer
pipx install jsbeautifier --force

# Install Python Tools
sudo pip install eyewitness
pip3 install py-altdns==1.0.2 
sudo pipx install jsbeautifier

# Install Go Tools
go install -v github.com/tomnomnom/{gf,anew,qsreplace,waybackurls,assetfinder}@latest
go install github.com/tomnomnom/gf@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/{katana,asnmap,nuclei,v3/cmd/shuffledns}@latest

# Download and Install Tools from GitHub
declare -A GIT_REPOS=(
  ["SecretFinder"]="https://github.com/m4ll0k/SecretFinder.git"
  ["Zphisher"]="https://github.com/htr-tech/zphisher.git"
  ["subzy"]="https://github.com/LukaSikic/subzy.git"
  ["Sniper"]="https://github.com/1N3/Sn1per.git"
  ["Gopherus"]="https://github.com/tarunkant/Gopherus.git"
  ["OneForAll"]="https://github.com/shmilylty/OneForAll.git"
  ["Bug-Bounty-Search-Engine"]="https://github.com/NitinYadav00/Bug-Bounty-Search-Engine.git"
  ["dirsearch"]="https://github.com/maurosoria/dirsearch.git"
  ["lazyrecon"]="https://github.com/nahamsec/lazyrecon.git"
  ["teh_s3_bucketeers"]="https://github.com/tomdev/teh_s3_bucketeers.git"
  ["wpscan"]="https://github.com/wpscanteam/wpscan.git"
  ["sqlmap"]="https://github.com/sqlmapproject/sqlmap.git"
  ["GitDorker"]="https://github.com/obheda12/GitDorker.git"
  ["ParamSpider"]="https://github.com/0xKayala/ParamSpider.git"
)

for repo in "${!GIT_REPOS[@]}"; do
  git clone "${GIT_REPOS[$repo]}"
done

# Build and Install Subzy Binary
cd subzy && go build main.go && sudo mv main /usr/bin/subzy && cd ..

# Setup Findomain
curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip
unzip findomain-linux.zip && sudo mv findomain /usr/bin/

# Install JSParser
cd JSParser* && sudo python setup.py install && cd ..

# Install Massdns
cd massdns && make && cd ..

# Install Burppro
curl https://raw.githubusercontent.com/xiv3r/Burpsuite-Professional/main/install.sh | sudo sh

# Nuclei Templates Setup
cd ~/Tools
git clone https://github.com/projectdiscovery/nuclei-templates.git
git clone https://github.com/TeamDefronix/Cyberonix.git
git clone https://github.com/infosec-au/altdns.git
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

echo -e "\e[38;5;27m$(figlet 'Happy Hacking')\e[0m"
