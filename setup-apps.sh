#!/bin/bash

YELLOW='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[1;96m'
LIGHTBLUE='\033[1;27m'
LIGHTERBLUE='\033[1;33m'
GRAY='\033[1;231m'
BOLD='\033[1;0m'
NC='\033[0m'

echo -e "${BLUE}Installing required local development apps: "`date`"${NC}\n"

# install Homebrew

echo -e "${BLUE}INSTALLING HOMEBREW...${NC}"

xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
brew analytics off

# install vagrant >=1.8.6 and virtualbox >=5.1.14
echo -e "${BLUE}INSTALLING VIRTUALBOX...${NC}"
brew cask install virtualbox
echo -e "${BLUE}INSTALLING VAGRANT...${NC}"
brew cask install vagrant

# install ansible

echo -e "${BLUE}INSTALLING ANSIBLE...${NC}"

sudo easy_install pip
sudo pip install ansible

echo -e "${LIGHTBLUE}The required apps have been installed. "`date`"${NC}\n"