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

mkdir ~/vms 2> /dev/null
cd ~/vms/
read -p "$(echo -e $LIGHTERBLUE"Enter the name of your Acquia/Github private key "$NC"(ex. id_rsa): ")" MYPRIVATEKEY
read -p "$(echo -e $LIGHTERBLUE"Enter your ATGE Github username "$NC"(ex. D********): ")"  MYDNUMBER
read -p "$(echo -e $LIGHTERBLUE"Enter your ATGE Github access token "$NC"(from https://github.com/settings/tokens): ")" MYGITTOKEN
echo -e "\n"

rm -rf CMS-Drupal-MKTG

set -e

ssh-add ~/.ssh/"$MYPRIVATEKEY" 2> /dev/null

echo -e "${BLUE}CLONING THE $MYDNUMBER/CMS-Drupal-MKTG REPOSITORY${NC}"
git clone git@github.com:"$MYDNUMBER"/CMS-Drupal-MKTG.git
cp ~/setup-scripts/setup-sync.sh ~/vms/CMS-Drupal-MKTG/scripts/setup-sync.sh 
cp ~/setup-scripts/bash_profile ~/vms/CMS-Drupal-MKTG/scripts/bash_profile 
cp ~/setup-scripts/local.config.yml ~/vms/CMS-Drupal-MKTG/box/local.config.yml 

echo -e "${GREEN}$MYDNUMBER/CMS-Drupal-MKTG repository fork has been cloned.${NC}\n"
sleep 3

echo -e "${BLUE}ADDING UPSTREAM REPOSITORY${NC}"
cd ~/vms/CMS-Drupal-MKTG/
git remote add upstream git@github.com:DeVryEducationGroup/CMS-Drupal-MKTG.git
echo -e "${GREEN}DeVryEducationGroup/CMS-Drupal-MKTG has been added as an upstream repository.${NC}\n"
sleep 3

echo -e "${BLUE}INSTALLING VAGRANT PLUGINS${NC}"
ulimit -n 10000 2> /dev/null
vagrant plugin install vagrant-vbguest 2> /dev/null
vagrant plugin install vagrant-hostsupdater 2> /dev/null
vagrant plugin install vagrant-auto_network 2> /dev/null

echo -e "${BLUE}\nINSTALLING COMPOSER${NC}"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" 2> /dev/null
php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo ''; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" 2> /dev/null
php composer-setup.php --filename=composer 2> /dev/null
php -r "unlink('composer-setup.php');" 2> /dev/null
mkdir ~/vms/CMS-Drupal-MKTG/vendor
mkdir ~/vms/CMS-Drupal-MKTG/vendor/bin
mv composer ~/vms/CMS-Drupal-MKTG/vendor/bin/
cd /usr/local/bin
rm -rf composer
ln -s ~/vms/CMS-Drupal-MKTG/vendor/bin/composer composer

echo -e "${BLUE}\nADDING GITHUB ACCESS TOKEN${NC}"
composer config -g github-oauth.github.com "$MYGITTOKEN"
echo -e "${GREEN}Your Github access token has been added to the codebase.${NC}\n"
sleep 3

cd ~/vms/CMS-Drupal-MKTG/
composer clearcache 2> /dev/null

echo -e "${BLUE}LOCAL MKTG CODEBASE INSTALL${NC}"
read -e -p "Would you like to install your local codebase? (y/N)" choice1
[[ "$choice1" == [Yy]* ]] && composer install --prefer-dist || exit 0
cp ~/setup-scripts/bash_profile ~/vms/CMS-Drupal-MKTG/vendor/acquia/blt/scripts/blt/bash_profile
cp ~/setup-scripts/post-provision.php ~/vms/CMS-Drupal-MKTG/vendor/acquia/blt/scripts/drupal-vm/post-provision.php
echo -e "${GREEN}Local codebase has been installed.${NC}"
sleep 3

echo -e "${BLUE}LOCAL ENVIRONMENT VM INSTALL${NC}"
read -e -p "Would you like to install your VM? (y/N)" choice2
[[ "$choice2" == [Yy]* ]] && bash ~/setup-scripts/setup-vm.sh || exit 0