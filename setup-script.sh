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
echo -e "${BLUE}Install ATGE MKTG Local Dev Environment v1.0${NC}"
echo -e "${LIGHTBLUE}Started: "`date`"${NC}\n"
sleep 3


echo -e "${BLUE}LOCAL DEVELOPMENT APPLICATION INSTALLATION${NC}"
read -p "Would you like to install Homebrew, Virtualbox, Vagrant, and Ansible? (y/N)" choice1
[[ "$choice1" == [Yy]* ]] && bash ~/setup-scripts/setup-apps.sh || bash ~/setup-scripts/setup-local.sh
