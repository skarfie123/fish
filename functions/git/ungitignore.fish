function ungitignore
  set FILEPATH $argv[1]

  if test -z "$FILEPATH"
    echo "Usage: gitignore <file-path>"
    return 1
  end

  if not test -f "$FILEPATH"
    echo "File $FILEPATH does not exist."
    return 1
  end

  # if file is foo.bar.gitignore.txt then we want to rename to foo.bar.txt
  set NEWFILEPATH (string replace -r '(.*)\.gitignore\.(.*)' '$1.$2' $FILEPATH)
  if test -f "$NEWFILEPATH"
    echo "File $NEWFILEPATH already exists."
    return 1
  end

  mv $FILEPATH $NEWFILEPATH
        
end
