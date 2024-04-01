#!/bin/bash
update_remote () {
	git fetch origin
}
remote_change () {
	REMOTE_CHANGES=$(git rev-list --count master..remotes/origin/master)
	if [[ "$REMOTE_CHANGES" != "0" ]]
	then
		echo "You are behind Main by ${REMOTE_CHANGES} commits in $(pwd)"
	fi
}

local_change () {
	LOCAL_CHANGES=$(git status -s)
	if [[ -n $LOCAL_CHANGES ]]
	then
		echo "You have uncommited change in your $(pwd). You probably shoud clean that up."
		echo "$LOCAL_CHANGES"
	fi
}

check_change () {
	old_directory=$(pwd)
	cd $1
	update_remote
	remote_change
	local_change
	cd $old_directory
}

main () {
	REPOSITORY_LIST=("${XDG_DATA_HOME:-$HOME}/dotfiles" "${ZDOTDIR}/.zprezto")
	#REPOSITORY_LIST=("$HOME/dotfile")
	for repo in ${REPOSITORY_LIST[@]}; do
		check_change $repo
	done
}

main
