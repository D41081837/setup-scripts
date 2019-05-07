#!/bin/bash

YELLOW='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[1;96m'
LIGHTBLUE='\033[1;27m'
LIGHTERBLUE='\033[1;33m'
GRAY='\033[1;231m'
BOLD='\033[1;0m'
NC='\033[0m'

cd ~/vms/CMS-Drupal-MKTG/
echo -e "LOCAL ENVIRONMENT VM INSTALL\n"
read -e -p "Would you like to install your VM? (y/N)" choice2
[[ "$choice2" == [Yy]* ]] && bash ~/setup-scripts/setup-vm.sh || exit 0