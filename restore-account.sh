#!/bin/bash

echo "Did you install your private key?"
read 

git init
git remote add origin git@github.com:rvdh/homedir.git
git fetch
git reset origin/master  # this is required if files in the non-empty directory are in the repo
git checkout -t origin/master


# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Re-install applications
brew install mas
brew bundle

# Fix dock
dockutil --add /Applications/Google\ Chrome.app --replacing 'Safari'
dockutil --add /Applications/Airmail\ 3.app --replacing 'Mail'
dockutil --add /Applications/iTerm.app --after 'Airmail'

for app in 'Launchpad' 'Siri' 'Contacts' 'Calendar' 'Reminders' 'Maps' 'Photos' 'Messages' 'FaceTime' 'iTunes' 'iBooks' 'App Store' 'System Preferences'; do
    dockutil --remove "$app"
done

# Set key repeat
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -float 15

rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
