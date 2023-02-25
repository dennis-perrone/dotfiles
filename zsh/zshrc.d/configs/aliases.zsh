
alias vim='nvim'

# User specific aliases and functions

# Editor aliases are set in env_vars.sh file.

alias ls='ls --color=auto'
alias ll='ls -alh --color=auto'
alias lh='ls -lh --color=auto'
alias grep='grep --color=auto'
alias h='history | grep'
alias syshosts='cat /etc/hosts'
alias cal='cal -m'
alias pip-update='pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'
alias reload='source ~/.zshrc'
alias config='nvim ~/.zshrc'

# vimwiki and notes
alias wiki='nvim $HOME/wiki/index.md'
alias nn='~/bin/new_note.sh'

# git aliases
alias ga='git add .'
alias gc='git commit -a -m'
alias gp='git push'
alias gs='git status'
alias gcb='git checkout -b'

# zathura aliases
alias zathura-bmarks-edit='vim ~/.local/share/zathura/bookmarks'
alias zathura-bmarks-view='more ~/.local/share/zathura/bookmarks'