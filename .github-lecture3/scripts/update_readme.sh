#!/bin/bash

# Inputs
FREQ_RESULT=$1
GITHUB_USER=$2
TIMESTAMP=$(date)

# Update README
echo -e "\n[$GITHUB_USER - $FREQ_RESULT - $TIMESTAMP]" >> README.md

# Configure Git to use GitHub Actions user and email
git config --global user.name "github-actions"
git config --global user.email "github-actions@users.noreply.github.com"

# Add README.md to git, commit, and push the changes
git add README.md
git commit -m "Update README with vowel frequency results"
git push