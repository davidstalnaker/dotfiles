#!/bin/zsh
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' ''
zstyle ':completion:*' verbose true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' menu select=0
zstyle :compinstall filename '/Users/david/.zshrc'

bindkey '^[[Z' reverse-menu-complete

autoload -Uz compinit
autoload -U colors
colors
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install

PROMPT=$'%{\e[0;32m%}(%n@%m %{\e[0;37m%}%~%{\e[0;32m%})%{\e[0m%} '

source .aliases