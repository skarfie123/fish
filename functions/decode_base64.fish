# Anthropic Claude 3.5 Sonnet
# Base64 decode with padding fix
function decode_base64
    set len (math (string length $argv[1]) % 4)
    set input $argv[1]
    
    switch $len
        case 2
            set input $input"=="
        case 3
            set input $input"="
    end
    
    # Replace URL-safe chars and decode
    echo $input | tr '_-' '/+' | base64 -d 2>/dev/null
end