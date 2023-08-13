git_branch() {
    if [[ -a ".git" ]]; then
      BRANCH_NAME=$(echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`)
      echo $BRANCH_NAME
    else
        #echo ""
        BRANCH_NAME=""
    fi
}

pandoc() {
  echo pandoc $@
  podman run -it --rm -v $PWD:/work:Z -w /work pandoc/latex "$@"

}

function show_container() {
  if [[ -f "/run/.containerenv" ]]; then
    TOOLBOX_NAME=[$(cat /run/.containerenv | grep 'name=' | sed -e 's/^name="\(.*\)"$/\1/')]
    echo $TOOLBOX_NAME
  else
    TOOLBOX_NAME=""
  fi
}

function set_PS1() {
  if [[ -a ".git" ]] && [[ -f "/run/.containerenv" ]]; then
    export PS1="\[${LIGHT_GREEN}\]\$(show_container)\[${NC}\] \[${LIGHT_BLUE}\]\$(git_branch)\[${NC}\] \[${LIGHT_GREEN}\]❱\[${NC}\] "
  elif [[ -a ".git" ]]; then
    export PS1="\[${LIGHT_GREEN}\][\W]\[${NC}\] \[${LIGHT_BLUE}\]\$(git_branch)\[${NC}\] \[${LIGHT_GREEN}\]❱\[${NC}\] "
  elif [[ -f "/run/.containerenv" ]]; then
    export PS1="\[${LIGHT_GREEN}\]\$(show_container)\[${NC}\] \[${LIGHT_GREEN}\]❱\[${NC}\] "
  elif [[ "$(id -u)" == "0" ]]; then
    export PS1="\[${LIGHT_RED}\][\u] [\h] ❱\[${NC}\] "
  else
    export PS1="\[${LIGHT_GREEN}\][\W] ❱\[${NC}\] "
  fi
}
