#!/bin/bash

read -p "Enter branch name: " BRANCH_NAME
read -p "Enter PR title: " PR_TITLE
read -p "Enter PR description: " PR_DESCRIPTION

git checkout -b $BRANCH_NAME
if [ $? -ne 0 ]; then
    echo "Failed to create branch."
    exit 1
fi

# Assuming you've made changes, let's add and commit them.
git add .
git commit -m "Commit for PR"
if [ $? -ne 0 ]; then
    echo "Failed to commit changes."
    exit 2
fi

git push origin $BRANCH_NAME
if [ $? -ne 0 ]; then
    echo "Failed to push branch."
    exit 3
fi

gh pr create --base main --head $BRANCH_NAME --title "$PR_TITLE" --body "$PR_DESCRIPTION"
if [ $? -ne 0 ]; then
    echo "Failed to create PR."
    exit 4
fi
