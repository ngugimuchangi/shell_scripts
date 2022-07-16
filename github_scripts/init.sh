#!/bin/bash
# Shell script to initialize empty github repository
git init
if [ "$(echo $?)" = "0" ]; then
	touch README.md
	git add .
	if [ "$(echo $?)" = "0" ]; then
		git commit -m "first commit"
		if [ "$(echo $?)" = "0" ]; then
			git branch -M master
			if [ "$(echo $?)" = "0" ]; then
				read -p "$(tput setaf 2)Enter link to your remote:$(tput setaf 7) " REMOTE
				read -p "$(tput setaf 2)Enter your personal access token:$(tput setaf 7) " PAT
				REMOTE=https://$PAT@$(echo $REMOTE | cut -b 9-)
				git remote add origin "$REMOTE"
				if [ "$(echo $?)" = "0" ]; then
					git push -u origin master
					if [ "$(echo $?)" = "0" ]; then
						echo "$(tput setaf 2)Successful initialization"
					else
						echo "Failed to initalize. Try again" 1>&2
						rm -rf .git
						exit 1
					fi
				fi
			fi
		fi
	fi
fi
