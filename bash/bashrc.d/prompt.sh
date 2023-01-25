# Export all environmental variables

# prompt with git and taskwarrior
#export PS1="\[${LIGHT_GREEN}\][\u]\[${NC}\] \[${LIGHT_GREEN}\][\h]\[${NC}\] \[${LIGHT_BLUE}\][\W] \[${YELLOW}\]\$(task_count)\[${NC}\]\[${LIGHT_GREEN}\]\$(git_branch)\[${NC}\]$: "

# prompt with git and no taskwarrior
export PS1="\[${LIGHT_GREEN}\][\u]\[${NC}\] \[${LIGHT_GREEN}\][\h]\[${NC}\] \[${LIGHT_BLUE}\][\W] \[${LIGHT_GREEN}\]\$(git_branch)\[${NC}\]$: "
#export PS1="\[${LIGHT_GREEN}\][\u]\[${NC}\] \[${LIGHT_GREEN}\][\h]\[${NC}\] \[${LIGHT_BLUE}\][\W] \[${LIGHT_GREEN}\]\$(parse_git_branch)\[${NC}\]$: "

# prompt with git and no taskwarrior
# ref: https://github.com/darthlukan/dotfiles/blob/master/bash/.bashrc.d/promptrc
#export PS1="\[\e[31m\]\`is_toolbox\`\]\e[m\]\[\e[36m\]\`parse_git_branch\`\[\e[m\]\[\e[32m\]\\$ \[\e[m\]\[\e[37m\]❱\[\e[m\] "
