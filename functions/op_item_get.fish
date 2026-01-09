function op_item_get
    set ITEM_NAME $argv[1]
    op item get $ITEM_NAME --format json | jq '[.fields[] | select(.value != null) | {(.label): .value}] | add // {}'
end