#!/bin/bash

function import_dependency {
    dep_dir="$1"
    if [ -d $dep_dir ]; then
	cd $dep_dir
	bash publish.sh $ppath/deps
    else
	echo "WARNING: $dep_dir can't be found!"
    fi
}

git describe --always --tags > VERSION

ppath=$( pwd )
foldername=${ppath##*/}
releasename=$foldername-$( cat VERSION )

### dependencies importation  ###

# Add here, if necessary
# USAGE: import_dependency "rel-or-abs-path-to-the-project"

### Release ###

cd $ppath

if [ ! -d releases/$releasename ]; then
    mkdir -p releases/$releasename
fi

rsync -a --exclude 'releases' $ppath/ releases/$releasename

### If a release is required as a dependency ###

if [ $# -eq 1 ]; then
    rm -rf "$1"/$foldername "$1"/$releasename
    cp -R releases/$releasename "$1"
    ln -s $releasename "$1"/$foldername
fi
