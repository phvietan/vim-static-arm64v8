#!/bin/bash

docker run -i --rm -v "$PWD":/out -w /root arm64v8/docker /bin/sh <<EOF
apk add --no-cache gcc make musl-dev ncurses-static
cd /root
wget https://github.com/vim/vim/archive/v9.1.0790.tar.gz
tar xvfz v9.1.0790.tar.gz
cd vim-*
LDFLAGS="-static" ./configure --disable-channel --disable-gpm --disable-gtktest --disable-gui --disable-netbeans --disable-nls --disable-selinux --disable-smack --disable-sysmouse --disable-xsmp --enable-multibyte --with-features=huge --without-x --with-tlib=ncurses
make -j8
mkdir -p /out/
mv src/vim /out/vim
EOF