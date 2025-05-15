function tfps --description 'short terraform plan'
  # https://github.com/hashicorp/terraform/issues/10507#issuecomment-1120333083

  # Slurp to combine each separate json object into a single array, raw output for plain strings
  #
  # First map filters out the planned changes and builds a smaller object from the addr and action
  # Group by the actions, to put them in create, delete, read, and update arrays
  # Second map defines the action as a variable, removes the action from the object, deletes the action
  #   from each object, pulls the addr string out of the objects, and builds a string for each action group.
  #
  # Finally, run the output through another array pull to turn the array of strings into just strings.

  set PLAN $(terraform plan -json)

  if test $status -ne 0
    echo "$PLAN" | \
      jq --slurp --raw-output '
        map(
          select(.["@level"] == "error") |
            "\(.["@message"]):\n    filename: \(.diagnostic.range.filename)\n    context: \(.diagnostic.snippet.context)\n    code: \(.diagnostic.snippet.code)\n"
        ) |
        .[]
      ' 
    return 1
  end

  echo "$PLAN" | \
    jq --slurp --raw-output '
      map(
        select(.type == "planned_change") |
          {
            addr: .change.resource.addr,
            action: .change.action
          }
      ) |
      group_by(.action) |
      map(
        .[0].action as $action |
        del (.[].action) |
        map(.addr) |
        "\($action) (\(. | length)):\n    \(map(.) | join("\n    "))\n"
      ) |
      .[]
    '   
end
