# Export all environmental variables

# Export editor variable
#export EDITOR=/usr/bin/nvim
#export EDITOR=/usr/bin/vim
if [[ -f "/usr/bin/nvim" ]]; then
    export EDITOR=/usr/bin/nvim
    alias vim='nvim'
    alias vi='nvim'
elif [[ -f "/usr/bin/vim" ]]; then
    export EDITOR=/usr/bin/vim
    alias vi='vim'
else
    export EDITOR=/usr/bin/nano
    alias nvim='nano'
    alias vim='nano'
    alias vi='nano'
fi


# Configure Python VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/development/scripts/python
export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh

# Ruby Specific variables for Jekyll
#export GEM_HOME="$HOME/gems"
#export PATH="$HOME/gems/bin:$PATH"
