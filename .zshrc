source ~/.aliases

export TERM=xterm-256color

autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# completion
bindkey -e
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
bindkey '^[[Z' reverse-menu-complete
setopt complete_in_word
setopt always_to_end
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt inc_append_history
setopt extended_history
setopt hist_verify

COLOR=%{$fg[green]%}

export EDITOR=vi

PS1="$COLOR(%~)%{$reset_color%} "
