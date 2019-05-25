# Makefile for ubuntu-stripped
# (c) 2019 Sirio Balmelli

# depend on 'control' file to track whether target must be rebuilt
ubuntu-stripped.deb : ubuntu-stripped ubuntu-stripped/DEBIAN/control ./Makefile
	dpkg-deb --build $<

.PHONY: install
install: ubuntu-stripped.deb
	apt-get install --reinstall ./$<
