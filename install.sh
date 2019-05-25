#!/bin/bash
# Download, install and clean-up ubuntu-stripped on a barebones system.
# (c) 2019 Sirio Balmelli

set -e

die()
{
	echo "$*" >&2
	exit 1
}

# We should be being called from this URL:
URL=https://raw.githubusercontent.com/siriobalmelli/ubuntu-stripped/master/install.sh
[[ $(basename $0) == 'bash' ]] || die "run me with 'wget -q -O - $URL | bash'"

wget https://github.com/siriobalmelli/ubuntu-stripped/archive/master.tar.gz
tar -zxf master.tar.gz
rm master.tar.gz
pushd ubuntu-stripped-master

dpkg-deb --build ubuntu-stripped
sudo apt-get install --reinstall ./ubuntu-stripped.deb
sudo apt-get -y autoremove

popd
rm -rf ubuntu-stripped-master
