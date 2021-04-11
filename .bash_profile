#!/bin/bash
# Most *nix systems load .bash_profile on login and .bashrc on reload.
# The exception is Mac OSX, which loads .bash_profile for both.
# http://www.joshstaiger.org/archives/2005/07/bash_profile_vs.html

# Environment Variables
export EDITOR=vi
export DOTFILES=/Users/jeff/.dotfiles
export NVM_DIR="$HOME/.nvm"
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export SPELLCHECKER_PREFER_HUNSPELL=1
export RUBYOPT='-W0'

# force Ruby to use brew's version of openssl
openssl_dir=$(brew --prefix openssl)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=${openssl_dir}"

# Import secrets
source $DOTFILES/.secrets

# Custom Prompt and Helpers
source $DOTFILES/.bash_colors
source $DOTFILES/.bash_prompt
source $DOTFILES/.bash_functions
source $DOTFILES/.bash_aliases
source $DOTFILES/lib/bash-wakatime.sh

# Internal libs
source $DOTFILES/lib/git-completion                   # Git Completion
source $DOTFILES/lib/autoswitch-nvmrc                 # Auto-switch nodeJS version based on rmvrc like rbenv
source $DOTFILES/lib/.iterm2_shell_integration.bash   # iTerm2 integration

# Bash Completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  . "$(brew --prefix)/etc/bash_completion"
  complete -o default -F _git g
fi

# Node Version Manager
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"                                        # initialize NVM
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # NVM completion

# NPM Completion
source <(npm completion)

# Ruby Version Manager
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Python Version Manager
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# End Message
printf "${RED}reloaded shell${NO_COLOR}\n";
