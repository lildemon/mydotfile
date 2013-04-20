alias ls="ls -GF"
alias la="ls -GFA"
alias lss="ls -GathorF"
alias ll="ls -lah"

alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Edit aliase
alias ea="subl $DOTFILESDIR/bash/alias.bash"
alias ddir="cd $DOTFILESDIR"

## Use only one vim..http://vimeo.com/4446112
alias g='mvim --remote-silent'

if [[ "$(uname -s)" == MINGW32* ]]; then
	alias open=start
	alias chrome="open chrome"
fi

# 用sublime 打开 $DOTFILESDIR
alias e="subl $DOTFILESDIR"

alias vps="ssh root@vps.frontkit.net -p 2843"
alias kissy="chrome https://github.com/kissyteam/kissy"