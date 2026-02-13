function withprof
    set OLD_AWS_PROFILE $AWS_PROFILE
    set OLD_AWS_REGION $AWS_REGION
    prof
    $argv
    set -gx AWS_PROFILE $OLD_AWS_PROFILE
    set -gx AWS_REGION $OLD_AWS_REGION
end
