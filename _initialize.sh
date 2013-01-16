#!/bin/bash

#############################################################################
# _initialize.sh
#
# Author: Mike Helderman
#
# This script creates symlinks from the homedir to all dotfiles in ~/dotfiles
# Existing dotfiles in the homedir, if any, are moved to ~/dotfiles_org
#
#############################################################################

this_file=`basename $0`
dotfiles_dir=~/dotfiles
orgfiles_dir=~/dotfiles_org
files_tomove=`ls $dotfiles_dir`

echo
if ! [ -d $orgfiles_dir ]; then
	mkdir -p $orgfiles_dir
	echo "$orgfiles_dir created for backup of existing dotfiles"
fi
for file in $files_tomove; do
	if [[ $file != $this_file ]] && [[ $file != 'README.md' ]]; then
		if [ -L ~/.$file ]; then
			echo "~/.$file is already a symlink: skipped"
		else
			if [ -e ~/.$file ]; then
				mv ~/.$file $orgfiles_dir/$file
				echo "~/.$file moved to $orgfiles_dir/$file"
			fi
			ln -s $dotfiles_dir/$file ~/.$file
			echo "~/.$file symlink created"
		fi
	fi
done	
echo
