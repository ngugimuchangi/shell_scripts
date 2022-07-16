#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
if [-d "$HOME/.local/bin"] && [ ! -d "$HOME/bin" ]; then
	cp *.sh $HOME/.local/bin/
	rm $HOME/.local/bin/installation.sh
	echo $GREEN"Sucessful installation"
elif [ -d "$HOME/bin" ]; then
	cp *.sh $HOME/bin/
	rm $HOME/bin/installation.sh
	echo "$(tput setaf 2)Sucessful installation"
else
	echo $RED"$HOME.local/bin and $HOME./bin not found." 1>&2
	echo -e $RED"\tcreate bin directory and try installation again" 1>&2
fi
rm -rf .git
