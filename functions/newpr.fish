function newpr
    set OWNER $argv[1]
    set REPO $argv[2]
    set ISSUE_ID (string match -r '\d+$' $argv[3])
    set ISSUE_TITLE (gh issue view $ISSUE_ID --repo $OWNER/$REPO --json title --template "{{.title}}" | sed 's/[^[:alnum:]]/-/g' | tr '[:upper:]' '[:lower:]' | sed 's/^-*//;s/-*$//;s/-\{2,\}/-/g')
    set PR_COUNT (gh issue view $ISSUE_ID --repo $OWNER/$REPO --json closedByPullRequestsReferences --jq ".closedByPullRequestsReferences | length")
    set BRANCH_COUNT (gh api graphql \
        -f query='
            query($owner: String!, $name: String!, $number: Int!) {
                repository(owner: $owner, name: $name) {
                    issue(number: $number) {
                        linkedBranches {
                        totalCount
                        }
                    }
                }
            }' \
        -f owner=$OWNER \
        -f name=$REPO \
        -F number=$ISSUE_ID \
        --jq '.data.repository.issue.linkedBranches.totalCount')
    set INDEX (math "$PR_COUNT + $BRANCH_COUNT + 1")
    set BRANCH_NAME "$USER/$ISSUE_ID-$ISSUE_TITLE-$INDEX"
    echo "Creating branch: $BRANCH_NAME"
    gh issue develop $ISSUE_ID --repo $OWNER/$REPO --branch-repo $OWNER/(basename (git rev-parse --show-toplevel)) -c -n $BRANCH_NAME
end
