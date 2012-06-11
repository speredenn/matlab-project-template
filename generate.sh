#!/bin/bash

bash init.sh > /dev/null

if [ $# -ne 1 ]
then
  echo "Usage: bash `basename $0` project-name"
  exit $E_BADARGS
fi

templatepath=$( pwd )
cp -r $templatepath $templatepath/../"$1"
cd ../"$1"
rm -rf .git/ init.sh generate.sh README.md
touch README.md
git init > /dev/null
