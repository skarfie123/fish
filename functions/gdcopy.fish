function gdcopy --wraps=\\\(gd\\\)\ \|\ pbcopy
    begin
        echo '<details>

<summary>Git diff</summary>

```diff'
        gd
        echo '```

</details>'
    end | pbcopy
end
