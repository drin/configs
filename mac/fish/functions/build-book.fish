function build-book
    set owner_id  octalene
    set owner_gid http

    set build_dir (string replace -a '"' '' (grep "build-dir" book.toml | cut -d" " -f3))

    echo "Building mdbook html: $build_dir"
    mdbook build

    echo "Changing permissions for mdbook html..."
    sudo chown -R $owner_id:$owner_gid $build_dir

    set build_dir_owners (string split ' ' (ls -ld $build_dir | cut -d" " -f3,4))
    echo -e "Owner ID: $build_dir_owners[1]\nOwner GID: $build_dir_owners[2]"

    if test $build_dir_owners[1] = $owner_id; and test $build_dir_owners[2] = $owner_gid
        echo "Ownership correctly set."

    else
        echo "Invalid ownership"

    end
end
