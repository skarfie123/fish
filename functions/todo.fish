function todo --wraps=grep\ -rnEi\ --colour=always\ \ \"\#\ \\\?\|\#\ TODO\|\#\ FIXME\|\#\ HACK\|\\\[\ \\\]\|\\\[x\\\]\" --wraps=/usr/bin/grep\ -rnEi\ --colour=always\ \ \"//\ \\\?\|//\ TODO\|//\ FIXME\|//\ HACK\|\\\[\ \\\]\|\\\[x\\\]\"\ \*\*.cs\ \*\*.cshtml --description alias\ todo=/usr/bin/grep\ -rnEi\ --colour=always\ \ \"//\ \\\?\|//\ TODO\|//\ FIXME\|//\ HACK\|\\\[\ \\\]\|\\\[x\\\]\"\ \*\*.cs\ \*\*.cshtml
  /usr/bin/grep -rnEi --colour=always  "// \?|// TODO|// FIXME|// HACK|\[ \]|\[x\]" **.cs **.cshtml $argv
        
end
