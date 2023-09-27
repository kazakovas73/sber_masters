#!/bin/bash

repo_url="https://github.com/kazakovas73/ML.git"
url=$1
basename=$(basename $url)
repo_name=${basename%.*}

git clone $1
cd $repo_name
#git fetch origin $2:$2
git fetch origin $3:$3

echo ""
echo ""
echo "Different files:"
git diff --name-status $2 $3

cd ..
rm -rf $repo_name
