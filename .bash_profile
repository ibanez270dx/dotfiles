#!/bin/bash
# Most *nix systems load .bash_profile on login and .bashrc on reload.
# The exception is Mac OSX, which loads .bash_profile for both.
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

# Environment Variables
export EDITOR=vi
export DOTFILES=/Users/jeff/.dotfiles
export NVM_DIR="$HOME/.nvm"
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export PATH="~/bin:/Users/jeff/Library/Python/3.9/bin:$PATH"
export SPELLCHECKER_PREFER_HUNSPELL=1
export RUBYOPT='-W0'
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
source $DOTFILES/.secrets

# Custom Prompt and Helpers
source $DOTFILES/.bash_colors
source $DOTFILES/.bash_prompt
source $DOTFILES/.bash_functions
source $DOTFILES/.bash_aliases

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Ruby Version Manager
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

# Python Version Manager
eval "$(pyenv init -)"

# Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
  complete -o default -F _git g
fi

# Git Completion
source $DOTFILES/lib/git-completion

# Auto-switch nodeJS version based on rmvrc like rbenv
source $DOTFILES/lib/autoswitch-nvmrc

# NPM Completion
source <(npm completion)

# End Message
printf "${RED}reloaded shell${NO_COLOR}\n";
