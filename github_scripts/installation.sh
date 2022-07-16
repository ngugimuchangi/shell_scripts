#!/bin/bash
if [-d $HOME/.local/bin]
	cp  *.sh $HOME/.local/bin/
	rm $HOME/.local/bin/installation.sh
	echo "$(tput setaf 2)Sucessful installation"
else if [ -d $HOME/bin ]
	cp  *.sh $HOME/bin/
	rm $HOME/bin/installation.sh
	echo "$(tput setaf 2)Sucessful installation"
else
	echo "$(tput setaf 1)$HOME.local/bin and $HOME./bin not found." 1>&2
	echo -e "\t\t$(tput setaf 7)create bin directory and try installation again" 1>&2
fi
rm -rf .git
