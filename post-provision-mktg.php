#!/usr/bin/env php
<?php

$atge_access_token_old = '/home/vagrant/atge_access_token';

$atge_access_token_locations = [
  "/vagrant/vendor/acquia/blt/scripts/blt/atge_access_token",
  // This is the location during "release:test" execution.
  "/var/www/blt/scripts/blt/atge_access_token",
];

foreach ($atge_access_token_locations  as $atge_access_token_location) {
  if (file_exists($atge_access_token_location)) {
    $atge_access_token_target = "/home/vagrant/.atge_access_token";
    $atge_access_target_contents = file_get_contents($atge_access_token_target);
    if (file_exists($atge_access_token_location)) {
      $atge_access_token_contents = file_get_contents($atge_access_token_location);
      # Add blt alias to front of .bashpro so that it applies to non-interactive shells.
      $new_atge_access_token_contents = $atge_access_token_contents . $atge_access_target_contents;
      file_put_contents($atge_access_token_target, $new_atge_access_token_contents);
      break;
    }
  }
}

if (!isset($atge_access_token_target)) {
  echo "No Github access tokens were found.";
  exit(1);
}

$bash_profile_old = '/home/vagrant/bash_profile';

$bash_profile_locations = [
  "/vagrant/vendor/acquia/blt/scripts/blt/bash_profile",
  // This is the location during "release:test" execution.
  "/var/www/blt/scripts/blt/bash_profile",
];

foreach ($bash_profile_locations  as $bash_profile_location) {
  if (file_exists($bash_profile_location)) {
    $bash_profile_target = "/home/vagrant/.bash_profile";
    $bash_target_contents = file_get_contents($bash_profile_target);
    if (!strstr($bash_target_contents, "setup-sync.sh")) {
      $bash_profile_contents = file_get_contents($bash_profile_location);
      # Add blt alias to front of .bashpro so that it applies to non-interactive shells.
      $new_bash_profile_contents = $bash_profile_contents . $bash_target_contents;
      file_put_contents($bash_profile_target, $new_bash_profile_contents);
      break;
    }
  }
}

if (!isset($bash_profile_target)) {
  echo "No bash_profile config was found.";
  exit(1);
}

$alias_locations = [
  "/vagrant/vendor/acquia/blt/scripts/blt/alias",
  // This is the location during "release:test" execution.
  "/var/www/blt/scripts/blt/alias",
];

foreach ($alias_locations as $alias_location) {
  if (file_exists($alias_location)) {
    $bashrc_file = "/home/vagrant/.bashrc";
    $bashrc_contents = file_get_contents($bashrc_file);
    if (!strstr($bashrc_contents, "function blt")) {
      $alias_contents = file_get_contents($alias_location);
      # Add blt alias to front of .bashrc so that it applies to non-interactive shells.
      $new_bashrc_contents = $alias_contents . $bashrc_contents;
      file_put_contents($bashrc_file, $new_bashrc_contents);
      break;
    }
  }
}
if (!isset($bashrc_file)) {
  echo "Cannot find BLT alias to install.";
  exit(1);
}

