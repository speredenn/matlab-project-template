#!/bin/bash

function create_dir {
    for i in $@; do
	if [ ! -d "$i" ]; then
	    mkdir -p "$i"
	    echo "folder $i created..."
	else
	    echo "folder $i already exists... skipping..."
	fi
    done
}

create_dir cfun deps inputs outputs scripts sfun
