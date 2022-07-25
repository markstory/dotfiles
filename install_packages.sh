#!/usr/bin/env bash
set -ex

# The list of packages to install.
# This list is tailored to debian/ubuntu/pop_os and will
# require work if I ever change distros.
PACKAGES=()

# Basic tools
# Remember: NeoVim and Kitty are stored in the home directory
PACKAGES+=( "git" "fzf" "tmux" "build-essentails" "htop" "xclip")

# PHP and dependencies for my PHP work.
PACKAGES+=( "php8.1" "php8.1-curl"  "php8.1-intl" "php8.1-dom" "php8.1-sqlite3" "php8.1-xml" "php-8.1mbstring" "php8.1-memcache" "php8.1-mysql" "php8.1-pgsql")

# Other runtimes and launchers.
PACKAGES+=( "snap" "nodejs" "docker" "docker-compose" "mysql-server" )

# Music and life stuff.
PACKAGES+=( "rhythmbox" "steam" )

# Install all the packages
sudo apt install -y $PACKAGES

# Install snaps and flatpaks
snap install flutter --classic
snap install thunderbird

# Install volta and node tools
curl https://get.volta.sh | bash
volta install nodejs
volta install yarn

# Run additional configuration
flutter upgrade

# Desktop shortcuts
ln -s /var/lib/snapd/desktop/applications/thunderbird_thunderbird.desktop /usr/share/applications/ || true
ln -s /home/mark/.local/kitty.app/share/applications/kitty.desktop /usr/share/applications/ || true

# This contrib script is attached to `git diff`
sudo chmod +x /usr/share/doc/git/contrib/diff-highlight/diff-highlight || true
