## View history
function h() {
    if [ -z "$1" ]
    then
        history
    else
        history | grep "$@"
    fi
}

function mkdircd ()
{
    mkdir -p "$@" && eval cd "\"\$$#\"";
}

# Git related
function gitdiff() {
  git diff --no-ext-diff -w "$@" | mvim -R -
}

function src() {
	local files
	files=$(find $DOTFILESDIR -maxdepth 2 -name '*.bash')
	source_files $files
}

function google() {
	local key=${@// /%20}
	if [[ "$(uname -s)" == MINGW32* ]]; then
		open chrome "http://www.google.com/search?newwindow=1&output=search&sclient=psy-ab&q=$key&btnK="
	elif [[ "$(uname -s)" == Darwin ]]; then
		open "http://www.google.com/search?newwindow=1&output=search&sclient=psy-ab&q=$key&btnK="
	fi

}

function frontkit() {
	if [ -z "$1" ]; then
            cmd="http://frontkit.net/?home"
	else
            cmd="http://frontkit.net/$1"
	fi
	if [[ "$(uname -s)" == MINGW32* ]]; then
		open chrome $cmd
	elif [[ "$(uname -s)" == Darwin ]]; then
		open $cmd
	fi
}
