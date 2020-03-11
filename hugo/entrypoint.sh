#!/bin/sh -l

set -e

git config --global user.email "$EMAIL"
git config --global user.name "$GITHUB_ACTOR"

echo "begin to clone hugo source code"
git clone --recursive https://$GITHUB_ACTOR:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY.git blog
cd blog
rm -rf public

echo "begin to clone github page repository"
git clone --recursive https://$GITHUB_ACTOR:$GITHUB_TOKE@github.com/$GITHUB_ACTOR/$GITHUB_ACTOR.github.io.git public

echo "building hugo application"
hugo

echo "begin to deploy github page"
cd public

git add . && git commit -am 'auto build by hugo action'
git push origin master
