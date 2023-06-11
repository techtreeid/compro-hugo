#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

config="config.toml"
if [ "$1" = "upbusinesstheme" ]
    then config="config-upbusinesstheme.toml"
fi

theme=""
if [ "$1" = "upbusinesstheme" ]
    then theme="up-business-theme"
fi

# Build the project.
hugo --config $config -t $theme # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Pull latest changes
git checkout master
git stash
git pull origin master
git stash apply
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 2 ]
  then msg="$2"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
