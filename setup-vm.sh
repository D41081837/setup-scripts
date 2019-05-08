#!/bin/bash

# Set the VM name.
VM_NAME=adtalem.local

# Turn off the VMs.
cd ~/vms/CMS-Drupal-MKTG

# Check for existing VM files.
VM_STATUS="$('VBoxManage list runningvms | gsed -r 's/^"(.*)".*$/\1/' | grep 'adtalem.local' | wc -l')"
if [ "$VM_STATUS" == '1' ]
then
  # Build the VM.
  cd ~/vms/CMS-Drupal-MKTG
  vagrant up
  vagrant ssh
else
  # Remove existing VM files.
  vboxmanage list runningvms | gsed -r 's/.*\{(.*)\}/\1/' | xargs -L1 -I {} VBoxManage controlvm {} savestate
  VBoxManage controlvm adtalem.local poweroff
  vboxmanage unregistervm "$VM_NAME" --delete 
  vagrant destroy -f 
  cd ~/VirtualBox\ VMs
  rm -rf "$VM_NAME" 

  # Build the VM.
  cd ~/vms/CMS-Drupal-MKTG
  vagrant up
  vagrant ssh
fi
