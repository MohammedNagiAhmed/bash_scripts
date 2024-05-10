#!/bin/bash

# Define colors for success and failure messages
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'  # No Color

# Add universe repository
echo "01-Adding Universe repository...${NC}"
sudo add-apt-repository universe &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}01-Universe repository added successfully.${NC}"
else
  echo "${RED}01-Failed to add Universe repository.${NC}"
fi

# Add multiverse repository
echo "02-Adding Multiverse repository...${NC}"
sudo add-apt-repository multiverse &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}02-Multiverse repository added successfully.${NC}"
else
  echo "${RED}02-Failed to add Multiverse repository.${NC}"
fi

# Add php repository
echo "02-Adding php repository...${NC}"
sudo add-apt-repository ppa:ondrej/php -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}02-php repository added successfully.${NC}"
else
  echo "${RED}02-Failed to add php repository.${NC}"
fi

# Add flatpak repository
echo "02-Adding flatpak repository...${NC}"
sudo add-apt-repository ppa:flatpak/stable -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}02-flatpak repository added successfully.${NC}"
else
  echo "${RED}02-Failed to add flatpak repository.${NC}"
fi
sudo add-apt-repository ppa:flatpak/stable
# Add Sublime Text repository
echo "27-Adding Sublime Text repository...${NC}"
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
if [[ $? -eq 0 ]]; then
  echo "${GREEN}27-Sublime Text repository added successfully.${NC}"
else
  echo "${RED}27-Failed to add Sublime Text repository.${NC}"
  exit 1
fi

# Update package list
echo "03-Updating package list...${NC}"
sudo apt update

# Upgrade all packages
echo "04-Upgrading all packages...${NC}"
sudo apt upgrade -y

# Install curl
echo "05-Installing curl...${NC}"
sudo apt install curl &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}05-curl installed successfully.${NC}"
else
  echo "${RED}05-Failed to install curl.${NC}"
fi

# Install gnupg
echo "05-Installing gnupg...${NC}"
sudo apt install gnupg -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}05-gnupg installed successfully.${NC}"
else
  echo "${RED}05-Failed to install gnupg.${NC}"
fi

# Install wget
echo "06-Installing wget...${NC}"
sudo apt install wget -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}06-wget installed successfully.${NC}"
else
  echo "${RED}06-Failed to install wget.${NC}"
fi

# Install ssh
echo "07-Installing ssh...${NC}"
sudo apt install ssh -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}07-ssh installed successfully.${NC}"
else
  echo "${RED}07-Failed to install ssh.${NC}"
fi

# Install gnupg2
echo "07-Installing gnupg2...${NC}"
sudo apt install gnupg2 -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}07-gnupg2 installed successfully.${NC}"
else
  echo "${RED}07-Failed to install gnupg2.${NC}"
fi


# Install tar
echo "24-Installing tar...${NC}"
sudo apt install --reinstall tar -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}24-tar installed successfully.${NC}"
else
  echo "${RED}24-Failed to install tar.${NC}"
fi

# Download Git
echo "07-Downloading Git source code...${NC}"
wget https://www.kernel.org/pub/software/scm/git/git-2.43.0.tar.gz -O git.tar.gz &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}07-Git source code downloaded successfully.${NC}"
else
  echo "${RED}07-Failed to download Git source code.${NC}"
  exit 1
fi

# Extract Git source code
echo "07-Extracting Git source code...${NC}"
tar -zxf git.tar.gz &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}07-Git source code extracted successfully.${NC}"
else
  echo "${RED}07-Failed to extract Git source code.${NC}"
  exit 1
fi

# Navigate to Git source directory
cd git-* &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}07-Navigated to Git source directory successfully.${NC}"
else
  echo "${RED}07-Failed to navigate to Git source directory.${NC}"
  exit 1
fi

# Compile Git
echo "07-Compiling Git...${NC}"
sudo make prefix=/usr/local all &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}07-Git compiled successfully.${NC}"
else
  echo "${RED}07-Failed to compile Git.${NC}"
  exit 1
fi

# Install Git
echo "07-Installing Git...${NC}"
sudo make prefix=/usr/local install &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}07-Git installed successfully.${NC}"
else
  echo "${RED}07-Failed to install Git.${NC}"
  exit 1
fi

# Make Git default global branch main
echo "07-Making Git default global branch main..${NC}"
git config --global init.defaultBranch main &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}07-Git default global branch Maked main successfully.${NC}"
else
  echo "${RED}07-Failed to Make default global branch main.${NC}"
  exit 1
fi


# Install zsh
echo "33-Installing zsh...${NC}"
sudo apt install zsh -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}33-zsh installed successfully.${NC}"
else
  echo "${RED}33-Failed to install zsh.${NC}"
fi

# Install fonts-powerline
echo "34-Installing fonts-powerline...${NC}"
sudo apt install fonts-powerline -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}34-fonts-powerline installed successfully.${NC}"
else
  echo "${RED}34-Failed to install fonts-powerline.${NC}"
fi

# Set the default shell to zsh
echo "34-Installing fonts-powerline...${NC}"
sudo chsh -s $(which zsh) $(whoami) &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}34-zsh now is default shell successfully.${NC}"
else
  echo "${RED}34-Failed to set zsh default shell.${NC}"
fi

# Install oh-my-zsh
echo "34-Installing oh-my-zsh...${NC}"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install Powerlevel10k:
echo "34-Installing Powerlevel10k...${NC}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}34-powerlevel10k Installed successfully.${NC}"
else
  echo "${RED}34-Failed to Install powerlevel10k.${NC}"
fi

# Install openssl
echo "08-Installing openssl...${NC}"
sudo apt install openssl -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}08-openssl installed successfully.${NC}"
else
  echo "${RED}08-Failed to install openssl.${NC}"
fi

# Install expat
echo "09-Installing expat...${NC}"
sudo apt install expat -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}09-expat installed successfully.${NC}"
else
  echo "${RED}09-Failed to install expat.${NC}"
fi

# Install asciidoc
echo "10-Installing asciidoc...${NC}"
sudo apt install asciidoc -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}10-asciidoc installed successfully.${NC}"
else
  echo "${RED}10-Failed to install asciidoc.${NC}"
fi

# Install docbook2x
echo "11-Installing docbook2x...${NC}"
sudo apt install docbook2x -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}11-docbook2x installed successfully.${NC}"
else
  echo "${RED}11-Failed to install docbook2x.${NC}"
fi

# Install libcurl4-gnutls-dev
echo "12-Installing libcurl4-gnutls-dev...${NC}"
sudo apt install libcurl4-gnutls-dev -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}12-libcurl4-gnutls-dev installed successfully.${NC}"
else
  echo "${RED}12-Failed to install libcurl4-gnutls-dev.${NC}"
fi

# Install libexpat1-dev
echo "13-Installing libexpat1-dev...${NC}"
sudo apt install libexpat1-dev -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}13-libexpat1-dev installed successfully.${NC}"
else
  echo "${RED}13-Failed to install libexpat1-dev.${NC}"
fi

# Install libssl-dev
echo "14-Installing docbook2x...${NC}"
sudo apt install libssl-dev -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}14-libssl-dev installed successfully.${NC}"
else
  echo "${RED}14-Failed to install libssl-dev.${NC}"
fi

# Install make
echo "15-Installing make...${NC}"
sudo apt install make -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}15-make installed successfully.${NC}"
else
  echo "${RED}15-Failed to install make.${NC}"
fi

# Install build-essential
echo "16-Installing build-essential...${NC}"
sudo apt install build-essential -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}16-build-essential installed successfully.${NC}"
else
  echo "${RED}16-Failed to install build-essential.${NC}"
fi

# Install autoconf
echo "17-Installing autoconf...${NC}"
sudo apt install autoconf -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}17-autoconf installed successfully.${NC}"
else
  echo "${RED}17-Failed to install autoconf.${NC}"
fi

# Install libz-dev
echo "18-Installing libz-dev...${NC}"
sudo apt install libz-dev -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}18-libz-dev installed successfully.${NC}"
else
  echo "${RED}18-Failed to install libz-dev.${NC}"
fi

# Install gettext
echo "19-Installing gettext...${NC}"
sudo apt install gettext -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}19-gettext installed successfully.${NC}"
else
  echo "${RED}19-Failed to install gettext.${NC}"
fi

# Install libcurl4-gnutls-dev
echo "20-Installing libcurl4-gnutls-dev...${NC}"
sudo apt install libcurl4-gnutls-dev -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}20-libcurl4-gnutls-dev installed successfully.${NC}"
else
  echo "${RED}20-Failed to install libcurl4-gnutls-dev.${NC}"
fi

# Install ibexpat1-dev
echo "21-Installing ibexpat1-dev...${NC}"
sudo apt install ibexpat1-dev -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}21-ibexpat1-dev installed successfully.${NC}"
else
  echo "${RED}21-Failed to install ibexpat1-dev.${NC}"
fi

# Install cmake
echo "22-Installing cmake...${NC}"
sudo apt install cmake -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}22-cmake installed successfully.${NC}"
else
  echo "${RED}22-Failed to install cmake.${NC}"
fi

sudo apt install net-tools
# Install cmake
echo "22-Installing net-tools...${NC}"
sudo apt install net-tools -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}22-net-tools installed successfully.${NC}"
else
  echo "${RED}22-Failed to install net-tools.${NC}"
fi

# Install gcc
echo "23-Installing gcc...${NC}"
sudo apt install gcc -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}23-gcc installed successfully.${NC}"
else
  echo "${RED}23-Failed to install gcc.${NC}"
fi

# Refresh Snap
echo "26-Refreshing Snap...${NC}"
sudo apt install snapd -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}26-Snap refreshed successfully.${NC}"
else
  echo "${RED}26-Failed to refresh Snap.${NC}"
fi

# Install Sublime Text

echo "27-Installing Sublime Text...${NC}"

# Download and install GPG key
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}27-GPG key downloaded and installed successfully.${NC}"
else
  echo "${RED}27-Failed to download or install GPG key.${NC}"
  exit 1
fi

# Install Sublime Text
echo "27-Installing Sublime Text...${NC}"
sudo apt install sublime-text &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}27-Sublime Text installed successfully.${NC}"
else
  echo "${RED}27-Failed to install Sublime Text.${NC}"
  exit 1
fi



# Download Chrome package
echo "28-Downloading Chrome...${NC}"
wget -O chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}28-Chrome downloaded successfully.${NC}"
else
  echo "${RED}28-Failed to download Chrome.${NC}"
  exit 1
fi

# Install Chrome
echo "28-Installing Chrome...${NC}"
sudo dpkg -i ./chrome.deb &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}28-Chrome installed successfully.${NC}"
else
  echo "${RED}28-Failed to install Chrome.${NC}"
  exit 1
fi

# Download obs-studio_29
echo "33-Downloading obs-studio_29 ...${NC}"
wget -O obs-studio.deb "https://github.com/obsproject/obs-studio/releases/download/29.1.0-rc1/obs-studio_29.1.0.rc1-0obsproject1.jammy_amd64.deb" &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}33-obs-studio_29 Downloaded successfully.${NC}"
else
  echo "${RED}33-Failed to Download obs-studio_29.${NC}"
fi

# Install obs-studio_29
echo "33-Installing obs-studio_29.1.0.rc1-0obsproject1.jammy_amd64 ...${NC}"
sudo chmod +x obs-studio.deb
sudo dpkg -i obs-studio.deb &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}33-obs-studio_29.1.0.rc1-0obsproject1.jammy_amd64 installed successfully.${NC}"
else
  echo "${RED}33-Failed to install obs-studio_29.1.0.rc1-0obsproject1.jammy_amd64.${NC}"
fi

# Install core
echo "29-Installing core...${NC}"
sudo snap install core -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}29-core installed successfully.${NC}"
else
  echo "${RED}29-Failed to install core.${NC}"
fi

# restart snapd
echo "30-restarting snapd...${NC}"
sudo systemctl restart snapd &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}30-snapd restarted successfully.${NC}"
else
  echo "${RED}30-Failed to restart snapd.${NC}"
fi

# # install obs-studio
# echo "30-install obs-studio...${NC}"
# sudo snap install obs-studio &> /dev/null
# if [[ $? -eq 0 ]]; then
#   echo "${GREEN}30-snapd installed successfully.${NC}"
# else
#   echo "${RED}30-Failed to install obs-studio.${NC}"
# fi



# # connect obs-studio:avahi-control
# echo "30-connect obs-studio:avahi-control...${NC}"
# sudo snap connect obs-studio:avahi-control &> /dev/null
# if [[ $? -eq 0 ]]; then
#   echo "${GREEN}30-obs-studio:avahi-control connected successfully.${NC}"
# else
#   echo "${RED}30-Failed to connect obs-studio:avahi-control.${NC}"
# fi

# # connect obs-studio:kernel-module-observe
# echo "30-connect obs-studio:kernel-module-observe...${NC}"
# sudo snap connect obs-studio:kernel-module-observe &> /dev/null
# if [[ $? -eq 0 ]]; then
#   echo "${GREEN}30-obs-studio:kernel-module-observe connected successfully.${NC}"
# else
#   echo "${RED}30-Failed to connect obs-studio:kernel-module-observe.${NC}"
# fi

## connect obs-studio:screencast-legacy
#echo "30-connect obs-studio:screencast-legacy...${NC}"
#sudo snap connect obs-studio:screencast-legacy &> /dev/null
#if [[ $? -eq 0 ]]; then
#  echo "${GREEN}30-obs-studio:screencast-legacy connected successfully.${NC}"
#else
#  echo "${RED}30-Failed to connect obs-studio:screencast-legacy.${NC}"
#fi

# Install flatpak
echo "31-Installing flatpak...${NC}"
sudo apt install flatpak -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}31-flatpak installed successfully.${NC}"
else
  echo "${RED}31-Failed to install flatpak.${NC}"
fi



# Install ffmpeg
echo "30-Installing ffmpeg...${NC}"
sudo apt install -y ffmpeg-y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}30-ffmpeg installed successfully.${NC}"
else
  echo "${RED}30-Failed to install ffmpeg.${NC}"
fi

# Install gnome-software-plugin-flatpak
echo "30-Installing gnome-software-plugin-flatpak...${NC}"
sudo apt install gnome-software-plugin-flatpak -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}30-gnome-software-plugin-flatpak installed successfully.${NC}"
else
  echo "${RED}30-Failed to install gnome-software-plugin-flatpak.${NC}"
fi

# Add Flathub repository
echo "30-Add Flathub repository...${NC}"
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}30-Flathub repository Added successfully.${NC}"
else
  echo "${RED}30-Failed to Add Flathub repository.${NC}"
fi

# Install chrome-gnome-shell
echo "32-Installing chrome-gnome-shell...${NC}"
sudo apt-get install chrome-gnome-shell -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}32-chrome-gnome-shell installed successfully.${NC}"
else
  echo "${RED}32-Failed to install chrome-gnome-shell.${NC}"
fi

# Install gnome-shell-extension-manager
echo "32-Installing gnome-shell-extension-manager...${NC}"
sudo apt install gnome-shell-extension-manager -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}32-gnome-shell-extension-manager installed successfully.${NC}"
else
  echo "${RED}32-Failed to install gnome-shell-extension-manager.${NC}"
fi

# Install unzip
echo "33-Installing unzip...${NC}"
sudo apt install unzip -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}33-unzip installed successfully.${NC}"
else
  echo "${RED}33-Failed to install unzip.${NC}"
fi


# Install software-properties-common
echo "33-Installing software-properties-common...${NC}"
sudo apt install software-properties-common -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}33-software-properties-common installed successfully.${NC}"
else
  echo "${RED}33-Failed to install software-properties-common.${NC}"
fi

# Install software-properties-common
echo "33-Installing apt-transport-https ...${NC}"
sudo apt install apt-transport-https -y &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}33-apt-transport-https  installed successfully.${NC}"
else
  echo "${RED}33-Failed to install apt-transport-https .${NC}"
fi

# Download vivaldi-stable_6.4
echo "33-Downloading vivaldi-stable_6.4 ...${NC}"
wget -O vivaldi.deb "https://downloads.vivaldi.com/stable/vivaldi-stable_6.4.3160.47-1_amd64.deb" &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}33-vivaldi-stable_6.4 Downloaded successfully.${NC}"
else
  echo "${RED}33-Failed to Download vivaldi-stable_6.4.${NC}"
fi

# Install vivaldi-stable_6.4
echo "33-Installing vivaldi-stable_6.4 ...${NC}"
sudo dpkg -i vivaldi.deb &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}33-vivaldi-stable_6.4 installed successfully.${NC}"
else
  echo "${RED}33-Failed to install vivaldi-stable_6.4.${NC}"
fi

# Download thorium-browser_117.
echo "33-Downloading thorium-browser_117. ...${NC}"
wget -O thorium_browser.deb "https://github.com/Alex313031/thorium/releases/download/M117.0.5938.157/thorium-browser_117.0.5938.157_amd64.deb" &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}33-thorium-browser_117. Downloaded successfully.${NC}"
else
  echo "${RED}33-Failed to Download thorium-browser_117..${NC}"
fi

# Install thorium-browser_117.
echo "33-Installing thorium-browser_117. ...${NC}"
sudo dpkg -i thorium_browser.deb &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}33-thorium-browser_117. installed successfully.${NC}"
else
  echo "${RED}33-Failed to install thorium-browser_117..${NC}"
fi




# Update package list
echo "finishing Updating package list...${NC}"
sudo apt update -y

# Update package list
echo "finishing upgrade package list...${NC}"
sudo apt dist-upgrade -y


# Update package list
echo "finishing Updating snap package list...${NC}"
sudo snap refresh &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}finishing snap Package list updated successfully.${NC}"
else
  echo "${RED}finishing Failed to update snap package list.${NC}"
fi

echo "${RED}|*********************************************|
|  add this line to /etc/gdm3/custom.conf.  |
     ${NC}sudo nano /etc/gdm3/custom.conf$RED}
      WaylandEnable=false     
|*********************************************|${NC}"

echo "${RED}|*********************************************|
|  Log Out then:
|  Set oh-my-zsh theme to Powerlevel10k by setting the following in your ~/.zshrc.

  ZSH_THEME=\"powerlevel10k/powerlevel10k\"

|*********************************************|${NC}"

echo "${GREEN}Please source your zshrc file or restart your terminal for the changes.${NC}"
# source your zshrc
echo "sourcing your zshrc...${NC}"
source ~/.zshrc &> /dev/null
if [[ $? -eq 0 ]]; then
  echo "${GREEN}zshrc sourced successfully.${NC}"
else
  echo "${RED}finishing Failed to sourced zshrc.${NC}"
fi

echo "${GREEN}Script execution completed installed 34 package.${NC}"
# Restart Bash shell
echo "${GREEN}Restarting Bash shell...${NC}"
exec bash
