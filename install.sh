#!/bin/bash
# Build and install ubuntu-stripped on a barebones system with no Make.
# (c) 2019 Sirio Balmelli

set -e
DEL_AFTER_INSTALL=

# We are being run with:
# 'wget -o stdout https://github.com/siriobalmelli/ubuntu-stripped/blob/master/install.sh | bash'
if [[ $(basename $0) == 'bash' ]]; then
	wget https://github.com/siriobalmelli/ubuntu-stripped/archive/master.tar.gz
	tar -zxf master.tar.gz
	rm master.tar.gz
	pushd ubuntu-stripped-master
	DEL_AFTER_INSTALL=1

# Repo already downloaded and being run inside repo
else
	pushd $(dirname $0)
fi

dpkg-deb --build ubuntu-stripped
sudo apt-get install --reinstall ./ubuntu-stripped.deb

popd
[[ $DEL_AFTER_INSTALL ]] && rm -rf ubuntu-stripped-master
