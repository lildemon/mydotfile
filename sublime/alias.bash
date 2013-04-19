if [[ "$(uname -s)" == MINGW32* ]]; then
	alias subl="/c/Program\ Files/Sublime\ Text\ 2/sublime_text.exe"
fi

# 用sublime 打开 $DOTFILESDIR
alias suble="subl $DOTFILESDIR"