# ubuntu-stripped

This is a Debian package which strips all unnecessary packages
    and services from a Server (CLI) install.

The goal is an Ubuntu server/VM installation that doesn't have any:

- tracking/reporting to Canonical
- Wifi and ISO / IEC 3166 alpha2 support
- Unused DBUS services (like accounts, etc)
- laptop-specific features
- dumbed-down firewalls (e.g. ufw) ... real admins use iptables or nftables

## Installing

```bash
# Alternative 1: fresh server install; one-liner
wget -q -O - https://raw.githubusercontent.com/siriobalmelli/ubuntu-stripped/master/install.sh | bash
```

```bash
# Alternative 2: fresh server install; but I want to know what's going on
wget https://github.com/siriobalmelli/ubuntu-stripped/archive/master.tar.gz
tar -zxf master.tar.gz
rm master.tar.gz
pushd ubuntu-stripped-master
dpkg-deb --build ubuntu-stripped
sudo apt-get install --reinstall ./ubuntu-stripped.deb
sudo apt-get autoremove
popd
rm -rf ubuntu-stripped-master
```

```bash
# Alternative 3: I have Git and Make installed
git clone https://github.com/siriobalmelli/ubuntu-stripped.git
cd ubuntu-stripped
make
sudo make install
```
