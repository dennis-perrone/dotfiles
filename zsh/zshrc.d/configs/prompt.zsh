# zsh configuration

autoload -Uz compinit vcs_info 

precmd() {
    vcs_info
    setopt prompt_subst
    if [[ -z ${vcs_info_msg_0_} ]]; then
        # Short prompt outside of a git repository.
	    #PROMPT="%(?.%B%F{green} ❱.%B%F{red} ❱)%f%b "
	    PROMPT="[%n][%m][%1~]%(?.%B%F{green} ❱.%B%F{red} ❱)%f%b "
	    RPROMPT='%B%F{magenta}%2~%f%b'
    else
        # Longer prompt inside of a git repository.
	    PROMPT="${vcs_info_msg_0_}%(?.%B%F{green}❱.%B%F{red}❱)%f%b "
	    RPROMPT='%B%F{magenta}%2~%f%b'
    fi
}
zstyle ':vcs_info:git:*' formats '%F{magenta}(%b)%f '
zstyle ':vcs_info:*' enable git

