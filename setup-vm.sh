#!/bin/bash

# Set the VM name.
VM_NAME=adtalem.local

# Turn off the VMs.
cd ~/vms/CMS-Drupal-MKTG/

# Check for existing VM files.

VM_STATUS = VBoxManage guestproperty get "$VM_NAME" "/VirtualBox/GuestInfo/Net/0/Status"

if [[ ! -e "$VM_STATUS" == 'No value set!' ]]; then
  # Build the VM.
  cd ~/vms/CMS-Drupal-MKTG/
  vagrant up
  vagrant ssh
else
  # Remove existing VM files.
  vboxmanage list runningvms | sed -r 's/.*\{($VM_NAME)\}/\1/' | xargs -L1 -I {} VBoxManage controlvm {} savestate
  vboxmanage unregistervm "$VM_NAME" --delete 2> /dev/null
  vagrant destroy -f 2> /dev/null
  cd ~/VirtualBox\ VMs
  rm -rf "$VM_NAME" 2> /dev/null

  # Build the VM.
  cd ~/vms/CMS-Drupal-MKTG/
  vagrant up
  vagrant ssh
fi
