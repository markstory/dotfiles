#!/usr/bin/env bash
OS_NAME=$(uname -a | cut -f1 -d' ')

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

##
# Link up cli tools that live deep in other packages.
##

# improved git diff-highlighting
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight $HOME/.dotfiles/bin/diff-highlight
chmod +x $HOME/.dotfiles/bin/diff-highlight


##
# Install other config files that don't just live in ~/
##
if [ -f "$HOME/.ssh/config" ];
then
    cp "$HOME/.ssh/config" "$HOME/.ssh/config.bak"
    echo "Backed up existing ssh/config file."
fi
rm "$HOME/ssh/config"
ln -s "$DOTFILES_DIR/app_config/ssh" "$HOME/.ssh/config"
echo " - Linked ~/.ssh/config"

if [[ ! -d "$HOME/.config/kitty" ]]; then
    mkdir -p "$HOME/.config/kitty"
fi
ln -s "$DOTFILES_DIR/app_config/kitty.config" "$HOME/.config/kitty/kitty.conf"
echo " - Linked ~/.config/kitty/kitty.conf"


echo '- Installing applications'
if [[ "$OS_NAME" = "Darwin" ]]; then
    brew install nvim fzf the_silver_searcher
fi
if [[ "$OS_NAME" = "Linux" ]]; then
    sudo apt install ack silversearcher-ag
fi
