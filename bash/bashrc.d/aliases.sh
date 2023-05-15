# User specific aliases and functions
#alias vi='nvim'
#alias vim='nvim'
#alias vi='vim'
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

# youtube-dl aliases
alias ytdl-video='youtube-dl --output "%(title)s.%(ext)s" -i -f mp4'
alias ytdl-playlist='youtube-dl --output "%(title)s.%(ext)s" -i -f mp4 --yes-playlist'
alias ytdl-music='youtube-dl --output "%(title)s.%(ext)s" -x --audio-format mp3 --audio-quality 0'

# vimwiki aliases
alias vimwiki-personal='vim $HOME/vimwiki/personal-md/index.md'
alias vimwiki-work='vim $HOME/vimwiki/work-md/index.md'
alias wiki='nvim $HOME/wiki/index.md'
alias nnm='$HOME/bin/new_mtg.sh'

# git aliases
alias ga='git add .'
alias gc='git commit -a -m'
alias gp='git push'
alias gs='git status'
alias gcb='git checkout -b'

# zathura aliases
alias zathura-bmarks-edit='vim ~/.local/share/zathura/bookmarks'
alias zathura-bmarks-view='more ~/.local/share/zathura/bookmarks'
