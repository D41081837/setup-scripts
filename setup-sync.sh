#!/bin/bash
#
# Example shell script to run post-provisioning.
#
# This script adds some VM configuration and syncs the sites.

BASH PROFILE_FILE=/home/vagrant/bash_profile

YELLOW='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[1;96m'
NC='\033[0m'

# Check to see if we've already performed this setup.
if [ ! -e "$BASH PROFILE_FILE" ]; then
  # Have the user enter their Github token.
  read -p "$(echo -e $BLUE"Enter your ATGE Github access token "$NC"(from https://github.com/settings/tokens): ")" MYGITTOKEN

  # Add the user's Github token.
  composer config -g github-oauth.github.com "$MYGITTOKEN"
  echo -e "${GREEN}Your Github access token has been added to the VM.${NC}"
  sleep 3

  # Run the refresh script.
  bash scripts/refresh-local.sh

  # Open the dashboard in Chrome.
  /usr/bin/open http://dashboard.adtalem.com

  # Remove the active bash_profile
  mv /home/vagrant/.bash_profile /home/vagrant/bash_profile
  source ~/.profile

  # Completion messages.
  echo -e "${YELLOW}Your local development VM has been setup.${NC}"
  echo -e "${YELLOW}Completed: "`date`"${NC}"

else
  exit 0
fi
