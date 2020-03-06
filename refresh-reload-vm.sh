#!/bin/bash
source ~/setup-scripts/.setup_vars

# Reprovision the VM.
cd ~/vms/$MYSTACK
vagrant reload --provision
vagrant up
vagrant ssh
