#!/bin/bash

# Atualiza a lista de pacotes e faz upgrade
echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

# Instala pacotes básicos
echo "Instalando pacotes básicos..."
sudo apt install -y git curl wget apt-transport-https ca-certificates gnupg

# Instala Docker
echo "Instalando Docker..."
sudo apt install -y docker.io\sudo systemctl enable --now docker

# Instala VSCode
echo "Instalando Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/packages.microsoft.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
sudo apt update && sudo apt install -y code

# Instala Brave Browser
echo "Instalando Brave Browser..."
sudo apt install -y curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt install -y brave-browser

# Instala Node.js
echo "Instalando Node.js..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Instala Discord
echo "Instalando Discord..."
wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"
sudo dpkg -i discord.deb || sudo apt install -f -y
rm discord.deb

# Instala AnyDesk
echo "Instalando AnyDesk..."
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk.list
sudo apt update && sudo apt install -y anydesk

# Instala DBeaver
echo "Instalando DBeaver..."
wget -O dbeaver.deb https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver.deb || sudo apt install -f -y
rm dbeaver.deb

# Instala Insomnia
echo "Instalando Insomnia..."
wget -O insomnia.deb "https://updates.insomnia.rest/downloads/ubuntu/latest?&app=com.insomnia.app&source=website"
sudo dpkg -i insomnia.deb || sudo apt install -f -y
rm insomnia.deb

# Instala Spotify
echo "Instalando Spotify..."
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install -y spotify-client

# Limpeza final
echo "Limpando pacotes desnecessários..."
sudo apt autoremove -y && sudo apt clean

echo "Instalação concluída!"
