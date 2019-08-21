#!/bin/bash

declare -r DOTFILES_ROOT=$HOME/github/dotfiles
declare -r DOTFILES_RESOURCE=$HOME/github/dotfiles/resource

declare -r NEOVIM_DIR=$HOME/.config/nvim

set -e

_install_neovim () {
  cd $DOTFILES_ROOT

  echo "Installing neovim"
  # macOS
  if [ uname -a | fgrep -i Darwin > /dev/null ]; then
    brew update
    brew install neovim
  # like debian
  elif [ $(type -p apt) > /dev/null ]; then
    if [ uname -a | fgrep -i "18.04" | fgrep -i "Ubuntu" ]; then
      sudo apt autoremove -y
      sudo apt update -y
      sudo apt install -y neovim
    # Ubuntu 18.04 than less
    else
      sudo apt-get autoremove -y
      sudo apt-get install -y software-properties-common
      sudo apt-get install -y python-software-properties
      sudo add-apt-repository -y ppa:neovim-ppa/stable
      sudo apt-get update -y
      sudo apt-get install -y neovim
      sudo apt-get install -y python-dev python-pip python3-dev python3-pip
      sudo apt-get install -y python-dev python-pip python3-dev
      sudo apt-get install -y python3-setuptools
      sudo easy_install3 -y pip
    fi
  # CentOS
  elif [ $(type -p yum) > /dev/null ]; then
    sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    sudo yum install -y neovim python3-neovim
  # Linux
  elif [ uname | fgrep -i Linux > /dev/null ]; then
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    chmod u+x nvim.appimage
    ./nvim.appimage
  fi

  echo "Installed neovim"

  # config file
  if [ ! $(ls $NEOVIM_DIR) ]; then
	  mkdir -p $NEOVIM_DIR
  fi
  cd $DOTFILES_RESOURCE
  ln -s init.vim $NEOVIM_DIR/init.vim

  echo "Completed"
  echo "If you want to install plugin for neovim, run :PluginInstall after run neovim"
}

_install_neovim
