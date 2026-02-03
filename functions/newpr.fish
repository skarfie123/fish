function newpr
    set OWNER $argv[1]
    set REPO $argv[2]
    set ISSUE_ID (string match -r '\d+$' $argv[3])
    set ISSUE_TITLE (gh issue view $ISSUE_ID --repo $OWNER/$REPO --json title --template "{{.title}}" | sed 's/[^[:alnum:]]/-/g' | tr '[:upper:]' '[:lower:]' | sed 's/^-*//;s/-*$//;s/-\{2,\}/-/g')
    set BRANCH_COUNT (git branch | grep "$USER/$ISSUE_ID-$ISSUE_TITLE-" | wc -l | tr -d ' ')
    set INDEX (math "$BRANCH_COUNT + 1")
    set BRANCH_NAME "$USER/$ISSUE_ID-$ISSUE_TITLE-$INDEX"
    echo "Creating branch: $BRANCH_NAME"
    gh issue develop $ISSUE_ID --repo $OWNER/$REPO --branch-repo $OWNER/(basename (git rev-parse --show-toplevel)) -n $BRANCH_NAME $argv[4..-1]
end
