#!/bin/bash
set -e

# Set the VM name.
VM_NAME=adtalem.local

# Turn off the VMs.
vagrant halt
vagrant destroy -f

# Check for existing VM files.

cd ~/VirtualBox\ VMs

if [ ! -e "$VM_NAME" ]; then
  # Build the VM.
  cd ~/vms/CMS-Drupal-MKTG/
  vagrant up
  vagrant ssh
else
  # Remove existing VM files.
  rm -rf VM_NAME

  vboxmanage unregistervm adtalem.local --delete
  
  # Build the VM.
  cd ~/vms/CMS-Drupal-MKTG/
  vagrant up
  vagrant ssh
fi