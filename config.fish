if status is-interactive
    # Commands to run in interactive sessions can go here
end

set GITHUB "$HOME/GitHub"
set S "$GITHUB/skarfie123"
set FISHGIT "$S/fish"

# https://www.pgcli.com/pager
set -gx LESS -SXFR # disable line wrapping + more for pgcli

set -gx EDITOR "$S/settings/code_wait.sh"

# https://www.reddit.com/r/fishshell/comments/176ahss/tip_you_can_use_function_subfolders_with_this/
set fish_function_path $FISHGIT/functions (path resolve $FISHGIT/functions/*/) $fish_function_path

#folders
# alias gh="cd $GITHUB"
alias s="cd $S"
alias home="cd $HOME"

alias ef="exec fish"
alias edit="code $S/fish"

#tools
# TODO: alias gt="for f in \$(git diff --name-only --cached); do todo \$f; done"
# TODO: alias gbl="for i in \$(git diff --name-only); do bl \$i; done;"
alias pause="read -p \"Press [Enter] key to continue...\""
alias dim='echo $(tput cols)x$(tput lines)'
# alias zshrc="code --wait ~/.zshrc; exec zsh"
alias e="exit 0"
alias op_signin="eval \$(op signin --account tessian)"
alias ipy="ptipython"
alias ll="ls -la"
alias che="chmod u+x"
set -gx GREP_OPTIONS '--color=auto'
# alias todo="grep -rnEi --colour=always  \"# \?|# TODO|# FIXME|# HACK|\[ \]|\[x\]\""
alias del="rm"
alias ydl="yt-dlp"
alias ydlmp3="ydl -x --audio-format mp3"
alias ffm="ffmpeg -hide_banner"
alias ffp="ffplay -hide_banner"
alias ffpr="ffprobe -hide_banner"
alias fr="kill $(ps -ax | grep -e flameshot | grep -v grep | awk '{print $1}'); open -a flameshot"
alias docker_nuke="docker kill \$(docker ps -q)"
alias docker_nuke_pro="docker rm \$(docker ps -a -q)"
alias pgadmin="docker run -e PGADMIN_DEFAULT_EMAIL=pgadmin4@pgadmin.org -e PGADMIN_DEFAULT_PASSWORD=admin -p 5050:80 dpage/pgadmin4"
alias ptest="pants test --debug"
alias pdb_old="ptest test.py -- -s -k test_function --pdbcls=IPython.terminal.debugger:Pdb"
alias pdb="pants test --debug-adapter"
alias itp="set -gx ITERMPLOT rv;set -gx MPLBACKEND \"module://itermplot\""
alias q="quicksearch search"
alias ql="quicksearch list"
alias qc="quicksearch config"
alias sshregen="ssh-keygen -f ~/.ssh/known_hosts -R"

alias b64d="python -c \"import base64; import sys; code = (sys.argv[1:] and sys.argv[1]) or input('Enter text to decode: '); print(base64.b64decode(code).decode())\""
alias b64e="python -c \"import base64; import sys; code = (sys.argv[1:] and sys.argv[1]) or input('Enter text to encode: '); print(base64.b64encode(code.encode()).decode())\""
alias inkscape="/Applications/Inkscape.app/Contents/MacOS/inkscape"
alias mmd="npx @mermaid-js/mermaid-cli -b \"#DDD\" -s 2 -e png -i"

function svgtopng -a file
    inkscape --export-type="png" -d 384 $file
end

eval "$(ssh-agent -c)"

quicksearch shell fish | source

if test -f $S/fish/work.fish
    source $S/fish/work.fish
end

# bind \cd delete-or-exit # this is the default
bind \cd delete-char

# Created by `pipx` on 2023-07-18 10:41:55
set PATH $PATH ~/.local/bin
if test -f ~/.config/op/plugins.sh
    source .config/op/plugins.sh
end

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1
set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1
if which pyenv
    pyenv init - | source
end

if which pyenv-virtualenv
    pyenv virtualenv-init - | source
end

if which lsd
    alias ls="lsd"
end
if which bat
    alias cat="bat"
end
if which gdu-go
    alias du="gdu-go"
end
if which fd
    alias find="fd"
end
if which rg
    alias grep="rg"
end

if which fzf
    fzf --fish | source
end

if which zoxide
    zoxide init fish --cmd cd | source
end

function cheat.sh
    curl cheat.sh/$argv
end
function cht.sh
    curl cht.sh/$argv
end

# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# register completions (on-the-fly, non-cached, because the actual command won't be cached anyway
complete -c cheat.sh -xa '(curl -s cheat.sh/:list)'
complete -c cht.sh -xa '(curl -s cht.sh/:list)'