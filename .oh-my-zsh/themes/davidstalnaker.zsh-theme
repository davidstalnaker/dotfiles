source ~/.aliases

if [ -f ~/.boxprefs ]
	then
		source ~/.boxprefs
	else
		BOXNAME=`hostname -s`
		COLOR=%{$fg[white]%}
fi
if [ "$(id -u 2> /dev/null)" = "0" ]
	then
		COLOR=%{$fg[red]%}
fi

PROMPT='$COLOR(%n@$BOXNAME %{$reset_color%}%c$COLOR)%{$reset_color%} '
RPROMPT=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="on $COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""