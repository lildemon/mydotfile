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