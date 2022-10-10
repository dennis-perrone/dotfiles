# Export all environmental variables

# Export editor variable
export EDITOR=/usr/bin/nvim

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Configure Python VirtualEnvWrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/development/scripts/python
export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh

# Ruby Specific variables for Jekyll
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Put BASH history into bashrc.d directory
export HISTFILE=$HOME/.bashrc.d/.bash_history
