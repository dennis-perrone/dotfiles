# Export all environmental variables

#export PS1="\[${LIGHT_GREEN}\][\u]\[${NC}\] \[${LIGHT_GREEN}\][\h]\[${NC}\] \[${LIGHT_BLUE}\][\W] \[${YELLOW}\]\$(task_count)\[${NC}\]\[${LIGHT_GREEN}\]\$(git_branch)\[${NC}\]$: "
export PS1="\[${LIGHT_GREEN}\][\u]\[${NC}\] \[${LIGHT_GREEN}\][\h]\[${NC}\] \[${LIGHT_BLUE}\][\W] \[${LIGHT_GREEN}\]\$(git_branch)\[${NC}\]$: "

export EDITOR=/usr/bin/nvim

# Configure Python VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/development/scripts/python
export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh

# Ruby Specific variables for Jekyll
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Put BASH history into bashrc.d directory
export HISTFILE=$HOME/.bashrc.d/.bash_history
