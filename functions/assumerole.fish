function assumerole
    set creds $(aws sts assume-role --role-arn $argv --role-session-name "rahul")
    and set -gx AWS_ACCESS_KEY_ID (echo $creds | jq -r ".Credentials.AccessKeyId")
    and set -gx AWS_SECRET_ACCESS_KEY (echo $creds | jq -r ".Credentials.SecretAccessKey")
    and set -gx AWS_SESSION_TOKEN (echo $creds | jq -r ".Credentials.SessionToken")
    and set -e AWS_PROFILE
end
