./configure --prefix=/usr    \
            --disable-static \
            --docdir=/usr/share/doc/expat-2.2.9

make

make check

make install

install -v -m644 doc/*.{html,png,css} /usr/share/doc/expat-2.2.9

