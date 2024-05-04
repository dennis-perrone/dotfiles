# User specific aliases and functions

## general aliases
alias sudo='sudo '
alias ls='ls --color=auto'
alias ll='ls -alh --color=auto'
alias lh='ls -lh --color=auto'
alias grep='grep --color=auto'
alias h='history | grep'
alias syshosts='cat /etc/hosts'
alias reload='.  ~/.bashrc'
alias cal='cal -m'
alias bash-config='vim ~/.bashrc'
alias pip-update='pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U'
#alias screen-refresh='~/.screenlayout/undocked.sh && sleep 1 && ~/.screenlayout/docked.sh'

# git aliases
alias ga='git add .'
alias gc='git commit -a -m'
alias gp='git push'
alias gs='git status'
alias gcb='git checkout -b'

# markdown lint
# MD013: Ignore line length
# MD033: Ignore inline html
alias mdl="podman run --rm -v $PWD:/workdir:Z ghcr.io/igorshubovych/markdownlint-cli:latest --disable MD013 MD033 -- '**/*.md'"

## minikube aliases
alias kubectl="minikube kubectl --"
alias k="kubectl"

## taskwarrior task aliases
alias t='task'
alias ta='task add'
alias tl='task list'
alias in='clear; task add +in'

## taskwarrior report aliases
alias trn='task +next list'
alias ttop='task +PENDING "(priority:H or priority:M)"'

## youtube-dl aliases
alias ytdl-video='youtube-dl --output "%(title)s.%(ext)s" -i -f mp4'
alias ytdl-playlist='youtube-dl --output "%(title)s.%(ext)s" -i -f mp4 --yes-playlist'
alias ytdl-music='youtube-dl --output "%(title)s.%(ext)s" -x --audio-format mp3 --audio-quality 0'

## vimwiki aliases
alias vimwiki-personal='vim $HOME/vimwiki/personal-md/index.md'
alias vimwiki-work='vim $HOME/vimwiki/work-md/index.md'
alias wiki='nvim $HOME/wiki/public/index.md'
alias wiki-private='nvim $HOME/wiki/private/index.md'
alias nnm='$HOME/bin/new_mtg'
alias nn='$HOME/bin/new_note'

# zathura aliases
alias zathura-bmarks-edit='vim ~/.local/share/zathura/bookmarks'
alias zathura-bmarks-view='more ~/.local/share/zathura/bookmarks'
