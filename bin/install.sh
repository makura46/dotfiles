#!/bin/bash

declare -r DOTFILES_ROOT=$HOME/github/dotfiles
declare -r DOTFILES_RESOURCE=$HOME/github/dotfiles/resource

declare -r NEOVIM_DIR=$HOME/.config/nvim
declare -r VUNDLE_DIR=$HOME/.config/nvim/bundle/Vundle.vim
declare -r VUNDLE_GIT="https://github.com/VundleVim/Vundle.vim.git"

set -e

_install_neovim () {
	cd $DOTFILES_ROOT

	echo -e "\nInstalling neovim\n"
	# macOS
	if uname -a | fgrep -i Darwin > /dev/null; then
		brew update
		brew install neovim
		# like debian
	elif type -p apt > /dev/null; then
		sudo apt autoremove -y
		sudo apt update -y
		sudo apt install -y neovim
		# CentOS
	elif type -p yum > /dev/null; then
		sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
		sudo yum install -y neovim python3-neovim
		# Linux
	elif uname | fgrep -i Linux > /dev/null; then
		curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
		chmod u+x nvim.appimage
		./nvim.appimage
	fi

	echo -e "\nInstalled neovim"

	# config file
	if ! ls $NEOVIM_DIR &> /dev/null; then
		mkdir -p $NEOVIM_DIR
	fi
	cd $DOTFILES_RESOURCE
	echo -e "\n> ln -s $DOTFILES_RESOURCE/init.vim $NEOVIM_DIR/init.vim"
	ln -s $DOTFILES_RESOURCE/init.vim $NEOVIM_DIR/init.vim

	echo -e "\n>> Completed\n"

	# Vundle
	echo -e "> Installing Vundle\n"
	git clone $VUNDLE_GIT $VUNDLE_DIR

	echo -e "\n> If you want to install plugin for neovim, run :PluginInstall after run neovim"
}

_install_neovim
