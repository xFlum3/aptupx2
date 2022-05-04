#!/bin/bash
#Ver: 1.0
#Dev: AlonD
#Description: Simple Apt Update & Upgrade Script.

#Echo Colors
RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
PINK='\033[1;35m'
WHITE='\033[1;37m'

updatesnupgrades() {
    echo -e "${GREEN} Checking Upgrades for new apt packages ... ${NC}"
    updatecount=$(sudo apt update 2>/dev/null | grep -i "packages" | cut -d" " -f1)

    if [[ $updatecount -gt 1 ]]
    then
        echo "$updatecount ${RED} packages ${NC} can be upgraded. Run 'apt list --upgradable' to see them."
        echo "Do you want to Upgrade ? Y|y = yes | n|N = no"
        read answer1
            if [ $answer1 = "y" ] || [ $answer1 = "Y" ]
            then
                echo -e "${GREEN} Starting apt packages upgrade ... ${NC}"
                update=$(sudo apt upgrade -y)
                echo "$update"
            else
                echo -e "${RED} Exiting ... ${NC}"
            fi
    elif [[ $updatecount -eq "All" ]]
    then
        uptodate=$(sudo apt update 2>/dev/null | grep -i "packages")
        echo "$uptodate"
    else
        echo -e "${RED} Err! ${NC}"
    fi
}

updatesnupgrades

exit 0