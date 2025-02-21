# Anthropic Claude 3.5 Sonnet
function decode_jwt
    # Read token from file
    set token $argv[1]
    
    # Split into parts using string split
    set token_parts (string split "." $token)
    
    # Decode header
    set header (decode_base64 $token_parts[1] | jq '.')
    echo "Header:"
    echo $header | jq '.'
    
    # Decode payload
    set payload (decode_base64 $token_parts[2] | jq '.')
    echo -e "\nPayload:"
    echo $payload | jq '.'
end