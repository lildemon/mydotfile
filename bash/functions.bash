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
		start chrome "http://www.google.com/search?newwindow=1&output=search&sclient=psy-ab&q=$key&btnK="
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

# An enhanced 'cd' - push directories
    # onto a stack as you navigate to it.
    #
    # The current directory is at the top
    # of the stack.
    #
    function stack_cd {
        if [ "$1" ]; then
            # use the pushd bash command to push the directory
            # to the top of the stack, and enter that directory
            pushd "$1" > /dev/null
        else
            # the normal cd behavior is to enter $HOME if no
            # arguments are specified
            pushd $HOME > /dev/null
        fi
    }
    # the cd command is now an alias to the stack_cd function
    #
    alias cd=stack_cd
    # Swap the top two directories on the stack
    #
    function swap {
        pushd > /dev/null
    }
    # s is an alias to the swap function
    alias s=swap
    # Pop the top (current) directory off the stack
    # and move to the next directory
    #
    function pop_stack {
        popd > /dev/null
    }
    alias p=pop_stack
    # Display the stack of directories and prompt
    # the user for an entry.
    #
    # If the user enters 'p', pop the stack.
    # If the user enters a number, move that
    # directory to the top of the stack
    # If the user enters 'q', don't do anything.
    #
    function display_stack
    {
        dirs -v
        echo -n "#: "
        read dir
        if [[ $dir = 'p' ]]; then
            pushd > /dev/null
        elif [[ $dir != 'q' ]]; then
            d=$(dirs -l +$dir);
            popd +$dir > /dev/null
            pushd "$d" > /dev/null
        fi
    }
    alias d=display_stack