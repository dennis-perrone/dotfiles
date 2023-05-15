git_branch() {
    if [[ -a ".git" ]]; then
        #echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'` "$: "
        echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'` ""
    else
        #echo "$: "
        echo ""
    fi
}

pandoc() {
  echo pandoc $@
  podman run -it --rm -v $PWD:/work:Z -w /work pandoc/latex "$@"

}
