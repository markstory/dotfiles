#!/usr/bin/env bash

! [ -f $HOME/.bash_profile.bak ] && \
	cp $HOME/.bash_profile $HOME/.bash_profile.bak && \
	echo 'Backed up bash_profile to bash_profile.bak'

rm $HOME/.bash_profile
ln -s $HOME/.dotfiles/bash_profile $HOME/.bash_profile

for file in $HOME/.dotfiles/config/*
do
	basefile=`basename $file`
	if [ -f "$HOME/.$basefile" ];
	then
		! [ -f "$HOME/.$basefile.bak" ] && \
			cp "$HOME/.$basefile" "$HOME/.$basefile.bak" && \
			echo "Backed up existing .$basefile to .$basefile.bak"
	fi
	if ! [ "$file" == '.' ] && ! [ "$file" == '..' ]; then
		rm "$HOME/.$basefile"
		ln -s $file "$HOME/.$basefile"
		echo " - Linked $basefile"
	fi
done

