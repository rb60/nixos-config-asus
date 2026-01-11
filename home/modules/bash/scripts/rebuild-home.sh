#!/bin/bash
cd /home/tima/nix
echo "Enter commit name"
read COMMIT_NAME
if [ "$COMMIT_NAME" != "" ]; then
	git add .
	git commit -m "$COMMIT_NAME"
	home-manager switch --flake /home/tima/nix/
	git push
fi
