#!/bin/bash
: << COMMENT
      Attention! This script is NOT TESTED YET! BE CAREFULL USING IT!
COMMENT

echo "installing dependencies for fennec-bar"

sudo pacman -Syu stow quickshell ttf-meslo-nerd || exit 1 # System update and instalation quickshell, meslo font for icons, and stow for easy symlink creation
defaultDir="~/.fennec-bar"

projectDir=$(pwd)

if [[ $projectDir != $defaultDir ]]; then
	echo "moving $projectDir to $defaultDir"
	cd
	mkdir $defaultDir || exit 1
	mv $projectDir $defaultDir; else
	echo "The path is corect"
fi

if $( test -d ~/.config/quickshell ); then
	echo "fond old quickshell config, moving to ~/.config/quickshell.backup"
	mv ~/.config/quickshell ~/.config/quickshell.backup
fi

cd .fennec-bar/config || exit 1

echo "creating symlinks to the project directory"

stow -v -t ~/.config .

echo "done. No problems reported:-D"

exit 0
