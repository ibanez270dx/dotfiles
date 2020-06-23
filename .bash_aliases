#!/bin/bash

##################################################
# System
##################################################

alias c="clear"
alias h="history"
alias l="ls -alhFG"

alias ip="ifconfig | grep \"inet \" | grep -v 127.0.0.1 | cut -d\  -f2"  # local IP
alias isp="wget -qO- http://checkip.amazonaws.com"                       # external IP
alias isp2="dig +short myip.opendns.com @resolver1.opendns.com"          # ...also external IP

alias hosts="sudo $EDITOR /etc/hosts"  # edit hosts file
alias sshc="$EDITOR ~/.ssh/config"     # edit SSH config

alias users="dscl . list /Users | grep -v '^_'"  # list all users
alias reindex-spotlight="sudo mdutil -E /"       # ...when all of a sudden I can't even find Chrome :/

##################################################
# Development
##################################################

alias be="bundle exec"                           # bundler
alias ngrok=". ~/Dev/ngrok"                      # start NGROK
alias server="python -m SimpleHTTPServer 8080"   # start a quick HTTP server in cwd
alias reload="source ~/.bash_profile"            # re-source shell
alias rs0="rails server -b 0.0.0.0"              # start rails and allow network devices to access
alias puma-pid="ps aux | grep puma | grep tcp | awk '{print $2}'"

# Shortcuts
alias dev="cd ~/Dev"
alias hu="cd ~/Dev/humani.se"
alias dotfiles="cd $DOTFILES"

# Cognoa
alias cog="cd ~/Dev/cognoa"
alias cog:ios="cd ~/Dev/cognoa-ios"
alias cog:xcode="open ~/Dev/cognoa-ios/Cognoa/Cognoa.xcworkspace"

# Aurify
alias au="cd ~/Dev/aurify"
alias au:rebuild="heroku builds:create --source-url https://api.github.com/repos/ibanez270dx/aurify/tarball/master?access_token=$AURIFY_GITHUB_ACCESS_TOKEN --app aurify"

##################################################
# Dotfiles
##################################################

alias va="cat $DOTFILES/.bash_aliases"     # View Aliases
alias vf="cat $DOTFILES/.bash_functions"   # View Functions
alias vp="cat $DOTFILES/.bash_profile"     # View Profile

alias aa="atom $DOTFILES/.bash_aliases"     # Edit Aliases using Atom
alias af="atom $DOTFILES/.bash_functions"   # Edit Functions using Atom
alias ap="atom $DOTFILES/.bash_profile"     # Edit Profile using Atom

alias ea="$EDITOR $DOTFILES/.bash_aliases && reload"     # Edit Aliases
alias ef="$EDITOR $DOTFILES/.bash_functions && reload"   # Edit Functions
alias ep="$EDITOR $DOTFILES/.bash_profile && reload"     # Edit Profile
