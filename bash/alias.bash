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
	alias ls='ls -F --show-control-chars'
elif [[ "$(uname -s)" == Darwin ]]; then
	alias chrome='open -a "Google Chrome"'
fi

# 用sublime 打开 $DOTFILESDIR
alias e="subl $DOTFILESDIR"
alias suble="subl $DOTFILESDIR"

alias vps="ssh ronhng@vps.frontkit.net -p 2843"
alias kissy="chrome https://github.com/kissyteam/kissy"
alias pq="pngquant --ext pq.png --iebug 256 --force"