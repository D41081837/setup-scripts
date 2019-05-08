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

echo -e "${BLUE}\nREFRESHING TEMPLATE.LOCAL...${NC}"
composer install --prefer-dist

vendor/bin/blt adtalem:sync:site -y
vendor/bin/blt adtalem:sync:files -y

echo ""
echo "======= Template Site ======="
drush cr -l template.local
drush updb -y -l template.local
drush cim sync -y -l template.local
drush cim sync -y -l template.local
drush cr -l template.local
drush user:create "$MYEMAIL" --password=pass --mail="$MYEMAIL" -l template.local
drush user-add-role "content_editor" "$MYEMAIL" -l template.local
echo "Login as admin: "
drush uli -l template.local
echo "Login as content author: "
drush uli --name="$MYEMAIL" -l template.local

echo "Completed: "`date`
