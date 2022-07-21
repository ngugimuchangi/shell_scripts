#!/bin/bash
# Script to add, commit and push changes to remote github repository
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
WHITE=$(tput setaf 7)
git add .
if [ "$(echo $?)" = "0" ]; then
	read -p $GREEN"Enter commit message:$WHITE " msg
	git commit -m "$msg"
	if [ "$(echo $?)" = "0" ]; then
		git push
		if [ "$(echo $?)" = "0" ]; then
			echo $GREEN"Success! Remote up to date"
		else
			git reset --mixed HEAD~
			echo -e $RED"Push failed. Check git error above for more details\n\
				HEAD reset on commit behind and changes unstaged" 1>&2
			exit 1
		fi
	elif [ "$(echo $?)" = "1" ]; then
		echo $GREEN"Nothing to commit"
	else
		echo $RED"Commit failed. Check git error above for more details" 1>&2
		exit 1
	fi
fi
