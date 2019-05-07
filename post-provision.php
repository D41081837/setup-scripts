#!/usr/bin/env php
<?php

$bash_profile_file = '/home/vagrant/bash_profile';

$bash_profile_locations = [
  "/vagrant/vendor/acquia/blt/scripts/blt/bash_profile",
  // This is the location during "release:test" execution.
  "/var/www/blt/scripts/blt/bash_profile",
];

foreach ($bash_profile_locations  as $bash_profile_location) {
  if (file_exists($bash_profile_location)) {
    $bashrc_file = "/home/vagrant/.bash_profile";
    $bashrc_contents = file_get_contents($bashrc_file);
    if (!strstr($bashrc_contents, "source")) {
      $bash_profile_contents = file_get_contents($bash_profile_location);
      # Add blt alias to front of .bashrc so that it applies to non-interactive shells.
      $new_bash_profile_contents = $bash_profile_contents . $bashrc_contents;
      file_put_contents($bashrc_file, $new_bashrc_contents);
      break;
    }
  }
}
if (!isset($bashrc_file)) {
  echo "Sync setup has already been completed.";
  exit(1);
}
