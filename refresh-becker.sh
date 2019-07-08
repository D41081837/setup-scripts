#!/bin/bash

YELLOW='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[1;96m'
LIGHTBLUE='\033[1;27m'
LIGHTERBLUE='\033[1;33m'
GRAY='\033[1;231m'
BOLD='\033[1;0m'
NC='\033[0m'

MYEMAIL="robert.shell+test@adtalem.com"

echo -e "${BLUE}\nREFRESHING BECKER.LOCAL...${NC}"
composer install --prefer-dist

vendor/bin/blt adtalem-ecom:sync:site -y
vendor/bin/blt adtalem-ecom:sync:files -y

echo ""
echo "======= Becker Site ======="
drush cr -l becker.local
drush updb -y -l becker.local
drush cim sync -y -l becker.local
drush cim sync -y -l becker.local
drush cr -l becker.local
drush user:create "$MYEMAIL" --password=pass --mail="$MYEMAIL" -l becker.local
drush user-add-role "content_editor" "$MYEMAIL" -l becker.local
echo "Login as admin: "
drush uli -l becker.local
echo "Login as content author: "
drush uli --name="$MYEMAIL" -l becker.local

echo "Completed: "`date`
