source ~/.aliases

autoload -U colors && colors
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# completion
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
bindkey '^[[Z' reverse-menu-complete
setopt complete_in_word
setopt always_to_end
setopt correctall
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3 + 1))numeric)'
zstyle ':completion:*:*:*:*:*' menu select

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt append_history
setopt extended_history
setopt hist_verify

if [ -f ~/.boxprefs ]
	then
		source ~/.boxprefs
	else
		COLOR=%{$fg[white]%}
fi
if [ "$(id -u 2> /dev/null)" = "0" ]
	then
		COLOR=%{$fg[red]%}
fi


PS1="$COLOR(%n@%m %{$reset_color%}%C$COLOR)%{$reset_color%} "

