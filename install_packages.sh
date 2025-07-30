#!/usr/bin/env bash
set -ex

# The list of packages to install.
# This list is tailored to debian/ubuntu/pop_os and will
# require work if I ever change distros.
PACKAGES=()

# Basic tools
# Remember: NeoVim and Kitty are stored in the home directory
PACKAGES+=( "curl"  "git" "fzf" "tmux" "htop" "xclip" )
PACKAGES+=( "ack" "silversearcher-ag" "zbar-tools" "sqlite3" )
PACKAGES+=( "direnv" "duplicity" )

# headers for building python and others
PACKAGES+=( "build-essential" "libssl-dev" "zlib1g-dev" "libbz2-dev" "libreadline-dev" "libsqlite3-dev" )

# PHP and dependencies for my PHP work.
PACKAGES+=( "php" "php-curl"  "php-intl" "php-dom" "php-sqlite3" "php-xml" "php-mbstring" "php-memcache" "php-mysql" "php-pgsql")

# Databases
PACKAGES+=( "sqlite3" "mysql-server" "postgresql" )

# Other runtimes and launchers.
PACKAGES+=( "snap" "nodejs" "podman" "podman-compose" "mysql-server" )

# Music and life stuff.
PACKAGES+=( "rhythmbox" "steam" )

# Install all the packages
sudo apt install -y $PACKAGES

# Install snaps and flatpaks
snap install vivaldi
snap install gimp
snap install inkscape
snap install flutter --classic
snap install thunderbird

flatpak install com.discordapp.Discord
flatpak install com.slack.Slack

# Install volta and node tools
curl https://get.volta.sh | bash
volta install node
volta install yarn

# Run additional configuration
flutter upgrade

# Desktop shortcuts
ln -s /var/lib/snapd/desktop/applications/thunderbird_thunderbird.desktop /usr/share/applications/ || true
