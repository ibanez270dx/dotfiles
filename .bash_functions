#!/bin/bash

#################################################
# Diff helpers
#################################################

# returns all unstaged files
function changed_files {
  git ls-files -m | xargs
}

# returns all files from commits newer than develop
function branch_files {
  git diff --name-only develop HEAD | xargs
}

# run a command for each change individually
function each_change {
  git ls-files -m | xargs -L1 "${1}"
}

# run a command for all changes using the functions above
function lint {
  scope="${1}"
  cmd="${2}"

  case ${scope} in
    "changes" | "changed" | "c" | "unstaged" | "st")
      echo "${cmd} $(changed_files)"
      bundle exec ${cmd} $(changed_files)
      ;;
    "branch" | "br" | "commits" | "co")
      echo "${cmd} $(branch_files)"
      bundle exec ${cmd} $(branch_files)
      ;;
    *)
      echo "can't find function \`${scope}\`"
      ;;
  esac
}

#################################################
# Fix searchkick
#################################################

function sk {
  local method=${1}

  case ${method} in
    "clear" | "c")
      curl -XPUT -H "Content-Type: application/json" http://localhost:9200/_all/_settings -d '{"index.blocks.read_only_allow_delete": null}'
      ;;
  esac
  echo ""
}

#################################################
# Rails Databases
#################################################

# Backup a table. Defaults to *_backup,
# pass additional argument for *_whatever.
function backup_table {
  local t1=${1}
  local t2=${1}_${2:-backup}
  rails db << EOF
    drop table if exists $t2;
    create table $t2 like $t1;
    insert into $t2 select * from $t1;
    \! echo "copied $t1 to $t2 successfully!"
EOF
}

# Restore a table
function restore_table {
  local t1=${1}
  local t2=${1}_${2:-backup}
  rails db << EOF
    drop table $1;
    create table $t1 like $t2;
    insert into $t1 select * from $t2;
    \! echo "copied $t2 to $t1 successfully!"
EOF
}

#################################################
# RubyGems
#################################################

# pass rails version:
# uninstall_all_gems 2.2.2
uninstall_all_gems() {
  list=`gem list --no-versions`
  for gem in $list; do
    gem uninstall ${1} $gem -aIx
  done
  gem list
}

#################################################
# Chrome Extensions
#################################################

function copy-chrome-extension {
  if [ -n "$1" ]; then
    local name=${1};

    # optionally name the destination folder
    if [ -n "$2" ]; then name=${2}; fi

    # copy if the destination folder doesn't exist
    if [ ! -d "${HOME}/Dev/ChromeExtensions/${name}" ]; then
      mkdir -p ${HOME}/Dev/ChromeExtensions/${name}
      printf "\nCopying ${1} into ~/dev/ChromeExtensions/${name} ... "
      cp -r "${HOME}/Library/Application Support/Google/Chrome/Default/Extensions/${1}" "${HOME}/Dev/ChromeExtensions/${name}"
      printf "done!\n"
    else
      printf "\n~/dev/ChromeExtensions/${name} already exists! Either remove it or specify another name for the destination folder.\n"
    fi
  fi
}

#################################################
# Cloudwatch logs (really just a fancy shortcut)
#################################################

tailog() {
  if [ -n "$1" ]; then
    if [ "$1" == "prod" ]; then
      printf "tailing all streams in production log group /app-rails.log\n"
      saw --profile=prod watch /app-rails.log --expand
    elif [ "$1" == "stag" ]; then  # 'cause I know I'm gonna type this and get frustrated otherwise...
      printf "tailing staging stream \"app.cognoa-staging.com\" in log group /app-rails.log\n"
      saw watch /app-rails.log --prefix "app.cognoa-staging.com" --expand
    else
      printf "tailing staging stream \"$1.cognoa-staging.com\" in log group /app-rails.log\n"
      saw watch /app-rails.log --prefix "$1.cognoa-staging.com" --expand
    fi
  else
    printf "please pass subdomain or environment\n"
  fi
}

#################################################
# Cheat.sh completion
#################################################

_cht_complete() {
  local cur prev opts
  _get_comp_words_by_ref -n : cur

  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="$(curl -s cheat.sh/:list)"

  if [ ${COMP_CWORD} = 1 ]; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    __ltrim_colon_completions "$cur"
  fi
  return 0
}
complete -F _cht_complete cht.sh
