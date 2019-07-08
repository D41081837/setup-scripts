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
echo -e "${BLUE}ATGE Local Development Setup for Mac v1.1${NC}"
echo -e "${LIGHTBLUE}Started: "`date`"${NC}\n"
sleep 1

echo -e "${LIGHTERBLUE}CHECK FOR REQUIRED APPLICATIONS?${NC}"
read -p "Would you like to check for Homebrew, Virtualbox, Vagrant, and Ansible installations? (y/N)" choice1
[[ "$choice1" == [Yy]* ]] && bash ~/setup-scripts/setup-apps.sh || bash ~/setup-scripts/setup-stack.sh
