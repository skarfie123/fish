function todo --description 'todo cs cshtml'
  if count $argv > /dev/null
    for i in $argv
      echo $i
      /usr/bin/grep -rnEi --colour=always  "// \?|// TODO|// FIXME|// HACK|# \?|# TODO|# FIXME|# HACK|\[ \]|\[x\]" **.$i
    end
  else
    /usr/bin/grep -rnEi --colour=always  "// \?|// TODO|// FIXME|// HACK|# \?|# TODO|# FIXME|# HACK|\[ \]|\[x\]" **.*
  end
end
