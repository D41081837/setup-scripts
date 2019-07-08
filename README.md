# ATGE CMS-Drupal Setup Scripts

Scripts that setup a local development environment on Mac OSX for of Adtalem Global Education's Drupal CMS projects.


## Pre-requisites

1. You must generate an SSH key pair that will be used for these projects only. (RSA, 4096)
```js
ssh-keygen -f ~/.ssh/adtalem_rsa -t rsa -b 4096 -C "your.email@adtalem.com" -N ""
```
2. You must copy the public key to your clipboard and add it to both your ATGE Acquia Cloud account and your ATGE Github account.
```js
   pbcopy < ~/.ssh/adtalem_rsa.pub
```
ACQUIA CLOUD
   <a href="https://cloud.acquia.com/a/profile/ssh-keys">https://cloud.acquia.com/a/profile/ssh-keys</a>
GITHUB  
   <a href="https://github.com/settings/keys">https://github.com/settings/keys</a>
   
3. You must create a repository fork for each stack in your ATGE Github account.

CMS-Drupal-MKTG
   <a href="https://github.com/DeVryEducationGroup/CMS-Drupal-MKTG">https://github.com/DeVryEducationGroup/CMS-Drupal-MKTG</a>
CMS-Drupal-ECOM  
   <a href="https://github.com/DeVryEducationGroup/CMS-Drupal-ECOM">https://github.com/DeVryEducationGroup/CMS-Drupal-ECOM</a>
   

## Installation

Install from your OSX terminal. Enter the commands below to install.

```js
cd ~/
git clone git@github.com:D41081837/setup-scripts.git
bash setup-scripts/setup.sh
```
