#!/bin/bash
git add .
if [ "$(echo $?)" = "0" ]; then
	read -p "$(tput setaf 2)Commit message:$(tput setaf 7) " msg
	git commit -m "$msg"
	if [ "$(echo $?)" = "0" ]; then
		git push
		if [ "$(echo $?)" = "0" ]; then
			echo "\n$(tput setaf 2)Success! Remote up to date"
		else
			echo "push failed. check error above" 1>&2
			exit 1
		fi
	else
		echo "commit error" 1>&2
		exit 1
	fi
fi
