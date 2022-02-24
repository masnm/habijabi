#!/bin/bash

set -xe

git config --global user.name "Ahmmed Sakib Noman"
git config --global user.email nomanahmmed0@gmail.com
git config --global core.editor vim
git config --global init.defaultBranch master

TOTALKEY=$(gpg --list-secret-keys --keyid-format=long | grep sec)
TOTALKEY=${TOTALKEY:14:16}

git config --global user.signingkey $TOTALKEY
