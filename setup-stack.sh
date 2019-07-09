#!/bin/bash

YELLOW='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[1;96m'
LIGHTBLUE='\033[1;27m'
LIGHTERBLUE='\033[1;33m'
GRAY='\033[1;231m'
BOLD='\033[1;0m'
NC='\033[0m'

echo -e "\n"
echo -e "${LIGHTERBLUE}SELECT AN ATGE DEVELOPMENT STACK:${NC}"

rm -rf ~/setup-scripts/atge_vars

select stack in MKTG ECOM
do
    SAVEDSTACK='MYSTACK="'$stack'"'
    echo $SAVEDSTACK >> ~/setup-scripts/atge_vars
done

source ~/setup-scripts/atge_vars
bash ~/setup-scripts/setup-local-$MYSTACK.sh