#!/usr/bin/env php
<?php

$bash_profile_file ='/home/vagrant/bash_profile';

  if (file_exists($bash_profile_file)) {
      echo "Sync setup has already been completed.";
      exit(1);
  } else {
    $bashpf_file = "/var/www/adtalem/scripts/bash_profile";
    $bashpf_target = "/home/vagrant/.bash_profile";
    $bashpf_contents = file_get_contents($bashpf_file);
      file_put_contents($bashpf_target, $bashpf_contents);
    # Remove the active bash_profile
    exec('source /home/vagrant/.bash_profile')
  }

if (!isset($bashrc_file)) {
  echo "Sync setup has already been completed.";
  exit(1);
}
