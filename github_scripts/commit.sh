#!/bin/bash -x
# trial
echo -n "hello"
git add .
if [ "$(echo $?)" = "0" ]; then
	read -p 'Commit message: ' msg
	git commit -m "$msg"
	if [ "$(echo $?)" = "0" ]; then
		git push
		if [ "$(echo $?)" = "0" ]; then
			echo "your changes have been successfully pushed to your remote"
		else
			echo "push failed. check error above" 1>&2
			exit 1
		fi
	else
		echo "commit error" 1>&2
		exit 1
	fi
else
	echo "error at line 3"
	exit 1
fi
