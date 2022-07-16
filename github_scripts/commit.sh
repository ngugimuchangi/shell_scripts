#!/bin/bash
if [ $(git add .) ]; then
	read -p 'Commit message: ' msg
	if [ $(git commit -m $("$msg")) ]; then
		if [ $(git push) ]; then
			echo "your changes have been successfully pushed to your remote"
		else
			echo "push failed. check error above" 1>&2
			exit 1
		fi
	else
		echo "commit error" 1>&2
		exit 1
	fi
fi
