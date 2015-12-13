#!/bin/sh

SOURCE_BRANCH=$1
TAG=$2

if [ -z "$SOURCE_BRANCH" ]
then
	exit "You must specify a branch"
fi

if [ -z "$TAG" ]
then
	exit "You must specify a tag"
fi

git checkout $SOURCE_BRANCH

if [ "$?" = "1" ]
then
	exit "Failed to checkout $SOURCE_BRANCH"
fi

git checkout -b $SOURCE_BRANCH--$TAG

if [ "$?" = "1" ]
then
	exit "Failed to create tag branch $SOURCE_BRANCH--$TAG"
fi

if [ -e "build.sh" ]
then
	sh build.sh
elif [ -e "Gruntfile.js" ]
then
	grunt
fi


git add -f dist
git commit -m "Commiting dist for tag $TAG"

if [ "$?" = "1" ]
then
	exit "Failed to commit dist."
fi

git tag -a $TAG -m "Tagging $TAG from branch $SOURCE_BRANCH"

if [ "$?" = "1" ]
then
	exit "Failed to tag $TAG."
fi

git push origin $TAG

if [ "$?" = "1" ]
then
	exit "Failed to push $TAG to the remote repository"
fi

git checkout $SOURCE_BRANCH
git branch -D $SOURCE_BRANCH--$TAG
