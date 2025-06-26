function gdcopy --wraps=\\\(gd\\\)\ \|\ pbcopy
    begin
        echo '```diff'
        gd
        echo '```'
    end | pbcopy
end
