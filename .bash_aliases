#!/bin/bash

##################################################
# System
##################################################

alias c="clear"
alias h="history"
alias ls="ls -alhFG"
alias l="ls"

alias ip="ifconfig | grep \"inet \" | grep -v 127.0.0.1 | cut -d\  -f2"                         # local IPv4 address
alias isp="curl http://checkip.amazonaws.com"                                                   # external IPv4 address
alias isp6="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'\"' '{ print $2}'"  # external IPv6 address

alias hosts="sudo $EDITOR /etc/hosts"  # edit hosts file
alias sshc="$EDITOR ~/.ssh/config"     # edit SSH config

alias users="dscl . list /Users | grep -v '^_'"  # list all users
alias reindex-spotlight="sudo mdutil -E /"       # ...when all of a sudden I can't even find Chrome :/

alias gopen="hub browse"  # open github repo in default browser

##################################################
# Development
##################################################

alias be="bundle exec"                           # execute with bundler
alias server="python -m SimpleHTTPServer 8080"   # start a quick HTTP server in cwd

# Shortcuts
alias dev="cd ~/Dev"
alias dotfiles="cd $DOTFILES"

##################################################
# Dotfiles
##################################################

alias reload="source ~/.bash_profile"      # Re-source shell

alias va="cat $DOTFILES/.bash_aliases"     # View Aliases
alias vf="cat $DOTFILES/.bash_functions"   # View Functions
alias vp="cat $DOTFILES/.bash_profile"     # View Profile

alias aa="atom $DOTFILES/.bash_aliases"     # Edit Aliases using Atom
alias af="atom $DOTFILES/.bash_functions"   # Edit Functions using Atom
alias ap="atom $DOTFILES/.bash_profile"     # Edit Profile using Atom

alias ea="$EDITOR $DOTFILES/.bash_aliases && reload"     # Edit Aliases
alias ef="$EDITOR $DOTFILES/.bash_functions && reload"   # Edit Functions
alias ep="$EDITOR $DOTFILES/.bash_profile && reload"     # Edit Profile
