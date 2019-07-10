#!/bin/bash

YELLOW='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[1;96m'
LIGHTBLUE='\033[1;27m'
LIGHTERBLUE='\033[1;33m'
GRAY='\033[1;231m'
BOLD='\033[1;0m'
NC='\033[0m'

echo -e "\n"
read -p "Would you like to check for Homebrew, Virtualbox, Vagrant, and Ansible installations? (y/N)" choice1
[[ "$choice1" == [Yy]* ]] && sleep 2 || bash ~/setup-scripts/setup-stack.sh

# Install Homebrew
if ! brew_loc="$(type -p "brew")" || [[ -z $brew_loc ]]; then
echo -e "${BLUE}INSTALLING HOMEBREW...${NC}"
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask 2> /dev/null
brew install gnu-sed 2> /dev/null
brew analytics off 2> /dev/null
fi
echo -e "\n"
echo -e "${GREEN}Homebrew is installed. ${NC}"

# Install Virtualbox >=5.1.14
if ! vb_loc="$(type -p "VBoxmanage")" || [[ -z $vb_loc ]]; then
echo -e "${BLUE}INSTALLING VIRTUALBOX...${NC}"
brew cask install virtualbox 2> /dev/null
fi
echo -e "${GREEN}Virtualbox is installed.${NC}"

# Install Vagrant >=1.8.6
if ! vagrant_loc="$(type -p "vagrant")" || [[ -z $vagrant_loc ]]; then
echo -e "${BLUE}INSTALLING VAGRANT...${NC}"
brew cask install vagrant 2> /dev/null
fi
echo -e "${GREEN}Vagrant is installed. ${NC}"

# Install PIP
if ! pip_loc="$(type -p "pip")" || [[ -z $pip_loc ]]; then
echo -e "${BLUE}INSTALLING PIP...${NC}"
sudo easy_install pip 2> /dev/null
echo -e "${GREEN}Pip has been installed.${NC}"
fi

# Install Ansible
if ! ansible_loc="$(type -p "ansible")" || [[ -z $ansible_loc ]]; then
sudo pip install ansible 2> /dev/null
fi
echo -e "${GREEN}Ansible is installed.${NC}\n"

# Install local environment
echo -e "${LIGHTBLUE}All required applications been installed. ${NC}"
bash ~/setup-scripts/setup-stack.sh
