#new_note () {
#	if [[ -f $(date +%Y-%m-%d)_notes.txt ]]; then
#		vim $(date +%Y-%m-%d)_notes.txt                
#	else
#		touch $(date +%Y-%m-%d)_notes.txt
#		echo "Meeting: $1" > $(date +%Y-%m-%d)_notes.txt
#		vim $(date +%Y-%m-%d)_notes.txt
#	fi

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

# ref: https://github.com/darthlukan/dotfiles/blob/master/bash/.bashrc.d/promptrc
# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		#echo "[${BRANCH}${STAT}]"
        echo "(${BRANCH}${STAT})"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

function is_toolbox() {
    if [ "${HOSTNAME}" == "toolbox" ]
    then
        TOOLBOX_NAME=$(cat /run/.containerenv | grep -oP "(?<=name=\")[^\";]+")
        echo "[${HOSTNAME} ${TOOLBOX_NAME}]"
    fi
}
