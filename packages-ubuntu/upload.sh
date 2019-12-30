#!/bin/bash
DIR=$(dirname $0)
cd $DIR
DIFF=$(git diff-tree --no-commit-id --name-only -r HEAD)
if [[ $DIFF =~ "packages-ubuntu" ]]; then
    git add $DIR > /dev/null
    git commit -m "Updated backup" -q
    git push -f -q
    echo "$0 Updated git"
else
    echo "$0 Nothing New backed up"
fi
