#!/bin/bash

git describe --always --tags > VERSION

ppath=$( pwd )
foldername=${ppath##*/}
releasename=$foldername-$( cat VERSION )


if [ ! -d releases/$releasename ]; then
    mkdir -p releases/$releasename
fi

rsync -a --exclude 'releases' $ppath/ releases/$releasename
