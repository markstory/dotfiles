# for bin/b2backup.sh
# Encrypting and signing keys.
export BACKUP_GPG_KEY="51E58ABD6ACFDBF75E1DA203F8154F754E628BBA"
export BACKUP_GPG_PASSPHRASE="super metal banana magic mirror"

# Backblace account credentials
export BACKUP_B2_KEY="00414ffb7d874d1d9aca0be6f1f75b9036dc340fd8"
export BACKUP_B2_ACCOUNT="f6e0c97969b6"
export BACKUP_B2_BUCKET="mark-popos-backup"

# Local directory to backup
export BACKUP_PATH="/home/mark"
export BACKUP_EXCLUDES=(--exclude=/home/mark/.steam/ --exclude=/home/mark/Trash/ --exclude=/home/mark/Downloads/ --exclude=/home/mark/VirtualBox\ VMs/ --exclude=/home/mark/.local/ --exclude=/home/mark/.cargo --exclude=/home/mark/.npm/ --exclude=/home/mark/.docker/ --exclude=/home/mark/.vagrant.d/ --exclude=/home/mark/.cache/ --exclude=/home/mark/code/transloadit/ --exclude=/home/mark/.local/share/containers/)
