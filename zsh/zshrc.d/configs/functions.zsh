note () {
	if [[ -f $(date +%Y-%m-%d)_notes.md ]]; then
		echo "Meeting: $1\n" >> $(date +%Y-%m-%d)_notes.md
		vim '+ normal Go' $(date +%Y-%m-%d)_notes.md
	else
		echo "Creating notes for $(date +%Y-%m-%d) ..."
		echo "Meeting $1\n" >> $(date +%Y-%m-%d)_notes.md
                vim '+ normal Go' $(date +%Y-%m-%d)_notes.md
	fi
}

task_count() {
    if [[ `task +in +PENDING count` -gt '0' ]]; then
        echo "[" `task +in +PENDING count` " task(s) ]:"
   else
        echo ""
    fi
}

git_branch() {
    if [[ -a ".git" ]]; then
        #echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'` "$: "
        echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'` ""
    else
        #echo "$: "
        echo ""
    fi
}
