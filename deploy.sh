#!/bin/bash
set -e

wget https://github.com/spf13/hugo/releases/download/v0.15/hugo_0.15_linux_amd64.tar.gz
tar xzvf hugo_0.15_linux_amd64.tar.gz

./hugo_0.15_linux_amd64/hugo_0.15_linux_amd64

cd public
git init

git config user.name "Travis CI"
git config user.email "mirdhyn@gmail.com"

git add .
git commit -m "Deploy to GitHub Pages"

git push --force --quiet "https://${GH_TOKEN}@github.com/mirdhyn/inexcelsis.git" master:gh-pages > /dev/null 2>&1
