#!/bin/bash
git add . &
read -p 'Commit message: ' msg &
echo -e \"$msg\" | git commit -m  &
git push
