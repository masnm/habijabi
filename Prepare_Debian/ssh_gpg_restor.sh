#!/bin/bash

set -xe

# SSH

if [ -f ./.ssh/id_ed25519.txt ]; then
	mv ./.ssh/id_ed25519.txt ./.ssh/id_ed25519
fi

rm ./.ssh/known_hosts*
mv ./.ssh ~/
eval "$(ssh-agent -s)"
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
ssh-add ~/.ssh/id_ed25519

# GPG

gpg --import my-private-key.asc
rm my-private-key.asc
