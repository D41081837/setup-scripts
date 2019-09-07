# ATGE CMS-Drupal Setup Scripts

Scripts that setup a local development environment on Mac OSX for of Adtalem Global Education's Drupal CMS projects.

## Pre-requisites

1. You must generate an SSH key pair that will be used for these projects only. (RSA, 4096)
```js
ssh-keygen -f ~/.ssh/adtalem_rsa -t rsa -b 4096 -C "your.email@adtalem.com" -N ""
```

2. Copy the public key to your clipboard so it can be added to your cloud accounts.

```js
pbcopy < ~/.ssh/adtalem_rsa.pub
```
   
3. Add it to both your ATGE Acquia Cloud account and your ATGE Github account.

     ###### **ADD AN ACQUIA CLOUD KEY**
   <a href="https://cloud.acquia.com/a/profile/ssh-keys">https://cloud.acquia.com/a/profile/ssh-keys</a>
     ###### **ADD A GITHUB KEY** 
   <a href="https://github.com/settings/keys">https://github.com/settings/keys</a>
   
4. You must create a repository fork for each stack in your ATGE Github account.

     ###### **THE CMS-Drupal-MKTG STACK REPO**
   <a href="https://github.com/DeVryEducationGroup/CMS-Drupal-MKTG">https://github.com/DeVryEducationGroup/CMS-Drupal-MKTG</a>
     ###### **THE CMS-Drupal-ECOM STACK REPO**  
   <a href="https://github.com/DeVryEducationGroup/CMS-Drupal-ECOM">https://github.com/DeVryEducationGroup/CMS-Drupal-ECOM</a>

## Installation

Install from your OSX terminal. Enter the commands below to install.

```js
cd ~/
git clone git@github.com:CMS-Drupal-Setup-Scripts/setup-scripts.git

## Check Installed Software
bash CMS-Drupal-Setup-Scripts/setup_apps.sh

## Installation
bash CMS-Drupal-Setup-Scripts/setup.sh
```

## Refreshing AND Syncing Local Sites

## Refresh sites
bash CMS-Drupal-Setup-Scripts/refresh-sites-mktg.sh
bash CMS-Drupal-Setup-Scripts/refresh-sites-ecom.sh