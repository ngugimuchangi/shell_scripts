#!/bin/bash
# Script to add, commit and push changes to remote github repository
git add .
if [ "$(echo $?)" = "0" ]; then
	read -p "$(tput setaf 2)Enter commit message:$(tput setaf 7) " msg
	git commit -m "$msg"
	if [ "$(echo $?)" = "0" ]; then
		git push
		if [ "$(echo $?)" = "0" ]; then
			echo "$(tput setaf 2)Success! Remote up to date"
		else
			echo "Push failed. Check git error above for more details" 1>&2
			exit 1
		fi
	else
		echo "Commit failed. Check git error above for more details" 1>&2
		exit 1
	fi
fi
