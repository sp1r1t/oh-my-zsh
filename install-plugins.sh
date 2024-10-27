#!/bin/bash

force=
run=true

plugin_switch_file=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/.plugins-installed

if [ -f ${plugin_switch_file} ]; then
  # echo "Plugins already installed"
  run=
fi

# Loop through arguments
while [[ "$#" -gt 0 ]]; do
  case "$1" in
  -f | --force)
    force=true
    ;;
  esac
  shift
done

if [ "$force" ]; then
  echo "Force mode enabled."
  run=true
fi

if [ "$run" ]; then
  echo "Installing custom plugins"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/Pilaton/OhMyZsh-full-autoupdate.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ohmyzsh-full-autoupdate
  touch ${plugin_switch_file}
fi
