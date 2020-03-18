sudo yum install libcurl-devel expat-devel asciidoc xmlto docbook2X

mkdir -p ${HOME}/installers
mkdir -p ${HOME}/toolbox/git

pushd ${HOME}/installers
if [ ! -d "git-2.25.1" ]; then
    echo "Downloading and extracting git source..."

    # eventually automate getting most recent version from:
    # https://mirrors.edge.kernel.org/pub/software/scm/git/
    wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.25.1.tar.xz
    tar -xJf git-2.25.1.tar.xz
else
    echo "Using existing git source..."
fi

# Note: after building, will need to modify Makefile to use old name of
# docbook2X binary
# Reference: https://linuxfollies.blogspot.com/2015/11/docbook2x-texi.html
cd git-2.25.1/
make prefix=${HOME}/toolbox/git all doc
make prefix=${HOME}/toolbox/git install install-doc

popd
