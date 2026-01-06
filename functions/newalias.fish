function newalias
    alias $argv[1]="$argv[2]"
    funcsave --directory $S/fish/functions $argv[1]
end
