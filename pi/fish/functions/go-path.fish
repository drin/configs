function go-path
    set workdir_name (basename $PWD)
    set workdir_hash (echo (string sub --length 10 ($PWD | md5sum)))

    set -x -g GOPATH $HOME/.go-paths/$workdir_name-$workdir_hash

    if ! test -d $GOPATH
        echo "creating new go path: $GOPATH"
        # mkdir -p $GOPATH
        ln -s (pwd) $GOPATH
    else
        echo "using go path: $GOPATH"
    end
end

