version = $(shell git describe --always --tags)
ppath = $(shell pwd)
foldername = $(shell basename $(ppath))
releasename = $(foldername)-$(version)
gitrepo = $(shell git config --get remote.origin.url)
depfolders = $(shell mkdir -p deps; ls deps)

all:
	matlab -nodesktop -nodisplay -nosplash -r "run('./main.m')";

deploy:
	-rm -Rf ../$(releasename)
	git clone $(gitrepo) ../$(releasename)
	cd ../$(releasename); git submodule init
	cd ../$(releasename); git submodule update

upgrade-deps:
	git submodule update
