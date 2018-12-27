#!/bin/bash
#
# Build and deploy Hugo static site generator files in the public directory.
#
rm -rf public
hugo
git pull
git add --all
git commit -m "Commit from $(hostname) at $(date)"
git push
rsync -avzh public/* pla1.net:/var/www/blog.pla.social/.
