#!/bin/bash

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
  vboxmanage startvm "$VM_NAME" --type emergencystop 2> /dev/null
  vagrant halt 2> /dev/null
  vagrant destroy -f 2> /dev/null
  vboxmanage unregistervm "$VM_NAME" --delete 2> /dev/null
  rm -rf "$VM_NAME" 2> /dev/null

  # Build the VM.
  cd ~/vms/CMS-Drupal-MKTG/
  vagrant up
  vagrant ssh
fi