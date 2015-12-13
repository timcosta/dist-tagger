#!/bin/sh

SOURCE_BRANCH=$1

if [ -z "$SOURCE_BRANCH" ]
then
	exit "You must specify a branch"
fi

git checkout $SOURCE_BRANCH

echo $?
