if status is-interactive
    # Commands to run in interactive sessions can go here
end

set GITHUB "$HOME/GitHub"
set S "$GITHUB/skarfie123"
set -gx LESS -XFR # enable line wrapping + more for pgcli
set -gx EDITOR nano

#folders
alias gh="cd $GITHUB"
alias s="cd $S"
alias home="cd $HOME"

alias ef="exec fish"

#tools
alias gs="git status"
alias gl="git log"
alias gch="git checkout"
alias gchb="git checkout -b"
alias gchm="git checkout \$(git config init.defaultBranch)"
alias ga="git add"
alias gaa="ga -A"
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gcaa="gaa; gc"
alias gcu="git reset --soft HEAD~1"
alias gb="git branch"
alias gd="git diff"
alias gdc="git diff --cached"
alias gp="git pull"
alias gpom="git pull origin master"
alias gpu="git push"
# TODO: alias gt="for f in \$(git diff --name-only --cached); do todo \$f; done"
alias trigger="git commit --allow-empty -m \"Trigger CI\""
alias pause="read -p \"Press [Enter] key to continue...\""
alias dim='echo $(tput cols)x$(tput lines)'
alias zshrc="code --wait ~/.zshrc; exec zsh"
alias gcl="git clone"
alias git_chm_p_count="gchm; gp; git shortlog -s --author \"Rahul Pai\""
alias e="exit 0"
alias op_signin="eval \$(op signin --account tessian)"
alias ipy="ptipython"
alias ll="ls -la"
# TODO: alias gbl="for i in \$(git diff --name-only); do bl \$i; done;"
alias che="chmod u+x"
set -gx GREP_OPTIONS '--color=auto'
alias todo="grep -rnEi --colour=always  \"# \?|# TODO|# FIXME|# HACK|\[ \]|\[x\]\""
alias del="rm"
alias ydl="yt-dlp"
alias ydlmp3="ydl -x --audio-format mp3"
alias ffm="ffmpeg -hide_banner"
alias ffp="ffplay -hide_banner"
alias ffpr="ffprobe -hide_banner"
alias fr="kill $(ps -ax | grep -e flameshot | grep -v grep | awk '{print $1}'); open -a flameshot"
alias docker_nuke="docker kill \$(docker ps -q)"
alias docker_nuke_pro="docker rm \$(docker ps -a -q)"
alias ptest="pants test --debug"
alias pdb_old="ptest test.py -- -s -k test_function --pdbcls=IPython.terminal.debugger:Pdb"
alias pdb="pants test --debug-adapter"
alias itp="set -gx ITERMPLOT rv;set -gx MPLBACKEND \"module://itermplot\""
alias q="quicksearch search"
alias ql="quicksearch list"
alias qc="quicksearch config"
alias edit="code $S/fish"
alias pgadmin="docker run -e PGADMIN_DEFAULT_EMAIL=pgadmin4@pgadmin.org -e PGADMIN_DEFAULT_PASSWORD=admin -p 5050:80 dpage/pgadmin4"
alias prune="docker system prune --volumes"
alias sshregen="ssh-keygen -f ~/.ssh/known_hosts -R"

alias b64d="python -c \"import base64; code = input('Enter text to decode: '); print(base64.b64decode(code).decode())\""
alias b64e="python -c \"import base64; code = input('Enter text to encode: '); print(base64.b64encode(code.encode()).decode())\""
alias inkscape="/Applications/Inkscape.app/Contents/MacOS/inkscape"
alias mmd="npx @mermaid-js/mermaid-cli -b \"#DDD\" -s 2 -e png -i"

function svgtopng -a file
    inkscape --export-type="png" $file
end


quicksearch shell fish | source

if test -f ~/.config/fish/work.fish
    source ~/.config/fish/work.fish
end

# bind \cd delete-or-exit # this is the default
bind \cd delete-char

# Created by `pipx` on 2023-07-18 10:41:55
set PATH $PATH ~/.local/bin
if test -f ~/.config/op/plugins.sh
    source .config/op/plugins.sh
end

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

# register completions (on-the-fly, non-cached, because the actual command won't be cached anyway
complete -c cheat.sh -xa '(curl -s cheat.sh/:list)'
complete -c cht.sh -xa '(curl -s cht.sh/:list)'

# TODO: how do fish functions work?
function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (/bin/cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end