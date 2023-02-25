# zsh configuration

autoload -Uz compinit vcs_info 

precmd() {
    vcs_info
    setopt prompt_subst
    if [[ "$EUID" -ne 0 ]]; then
        if [[ -z ${vcs_info_msg_0_} ]]; then
            # Short prompt outside of a git repository.
            # PROMPT="[%n][%1~]%(?.%B%F{green} ❱.%B%F{red} ❱)%f%b "
            # RPROMPT='%B%F{magenta}%2~%f%b'
            PROMPT="[%B%F{green}%n%f%b][%B%F{magenta}%1~%f%b]%(?.%B%F{green} ❱.%B%F{red} ❱)%f%b "
        else
            # Longer prompt inside of a git repository.
            PROMPT="[%B%F{magenta}%1~%f%b]%B%F${vcs_info_msg_0_}%b%f%(?.%B%F{green}❱.%B%F{red}❱)%f%b "
            # RPROMPT='%B%F{magenta}%2~%f%b'
        fi
    else
        if [[ -z ${vcs_info_msg_0_} ]]; then
            # Short prompt outside of a git repository.
            PROMPT="[%B%F{red}%n%f%b][%B%F{magenta}%1~%f%b]%(?.%B%F{green} ❱.%B%F{red} ❱)%f%b "
        else
            # Longer prompt inside of a git repository.
            PROMPT="[%B%F{red}%1~%f%b]%B%F${vcs_info_msg_0_}%b%f%(?.%B%F{green}❱.%B%F{red}❱)%f%b "
        fi
    fi
}
zstyle ':vcs_info:git:*' formats '%F{magenta}(%b)%f '
zstyle ':vcs_info:*' enable git

