#!/bin/bash

# Set the VM name.
VM_NAME=adtalem.local

# Turn off the VMs.
cd ~/vms/CMS-Drupal-MKTG/
vagrant halt 2> /dev/null
vboxmanage startvm "$VM_NAME" --type emergencystop 2> /dev/null
vboxmanage unregistervm "$VM_NAME" --delete 2> /dev/null
vagrant destroy -f 2> /dev/null

# Check for existing VM files.

if [ ! -e "$VM_NAME" ]; then
  # Build the VM.
  cd ~/vms/CMS-Drupal-MKTG/
  vagrant up
  vagrant ssh
else
  # Remove existing VM files.

  cd ~/VirtualBox\ VMs
  rm -rf "$VM_NAME" 2> /dev/null

  # Build the VM.
  cd ~/vms/CMS-Drupal-MKTG/
  vagrant up
  vagrant ssh
fi