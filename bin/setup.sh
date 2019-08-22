#!/bin/bash

set -e

declare -r GIT_DIR="$HOME/github"
declare -r DOTFILES_ROOT="$GIT_DIR/dotfiles"
declare -r DOTFILES_BIN="$GIT_DIR/dotfiles/bin"
declare -r DOTFILES_GIT="https://github.com/makura46/dotfiles.git"

setup () {
  echo -e "Installing dotfiles\n"

  echo -e "> mkdir -p $GIT_DIR\n"
  mkdir -p $GIT_DIR
  cd $GIT_DIR

  # Install git
  if ! $(type -p git) > /dev/null; then
    # macOS
	if uname -a | fgrep -i Darwin > /dev/null; then
      brew update
      brew install git
    # like debian
    elif type -p apt > /dev/null; then
      sudo apt autoremove -y
      sudo apt update -y
      sudo apt install -y git
    # CentOS
    elif type -p yum > /dev/null; then
      sudo yum clean -y
      sudo yum update -y
      sudo yum install -y git
    else
      return 1
    fi
    echo -e "\nInstalled git\n"
  fi

  # Clone repository
  git clone "$DOTFILES_GIT"
  cd $DOTFILES_ROOT

  echo -e "\n> $DOTFILES_BIN/install.sh"
  "$DOTFILES_BIN/install.sh"
}

setup
