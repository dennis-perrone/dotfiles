# Export all environmental variables

# Export editor variable
if [[ -f "/usr/bin/nvim" ]]; then
	export EDITOR=/usr/bin/nvim
	alias vi='nvim'
	alias vim='nvim'
elif [[ -f "/usr/bin/vim" ]]; then
	export EDITOR=/usr/bin/vim
	alias vi='vim'
else
	export EDITOR=/usr/bin/nano
	alias vi='nano'
	alias vim='nano'
fi

# Configure Python VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/development/scripts/python
export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
source /usr/bin/virtualenvwrapper.sh

# Ruby Specific variables for Jekyll
#export GEM_HOME="$HOME/gems"
#export PATH="$HOME/gems/bin:$PATH"
