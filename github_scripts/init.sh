#!/bin/bash
# Shell script to initialize empty github repository
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
WHITE=$(tput setaf 7)
git init
if [ "$(echo $?)" = "0" ]; then
	touch README.md
	git add .
	if [ "$(echo $?)" = "0" ]; then
		git commit -m "first commit"
		if [ "$(echo $?)" = "0" ]; then
			git branch -M master
			if [ "$(echo $?)" = "0" ]; then
				read -p $GREEN"Enter HTTPS link to your remote:$WHITE " REMOTE
				read -p $GREEN"Enter your personal access token:$WHITE " PAT
				REMOTE=https://$PAT@$(echo $REMOTE | cut -b 9-)
				git remote add origin "$REMOTE"
				if [ "$(echo $?)" = "0" ]; then
					git push -u origin master
					if [ "$(echo $?)" = "0" ]; then
						echo $GREEN "Successful initialization"
					else
						echo $RED"Failed to initalize. Try again" 1>&2
						rm -rf .git
						exit 1
					fi
				fi
			fi
		fi
	fi
fi
