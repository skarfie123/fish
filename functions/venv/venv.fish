function venv
    mkdir -p ~/venvs
    pushd ~/venvs
    uv venv $argv[1]
    popd
end