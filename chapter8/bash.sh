patch -Np1 -i ../bash-5.0-upstream_fixes-1.patch

./configure --prefix=/usr                    \
            --docdir=/usr/share/doc/bash-5.0 \
            --without-bash-malloc            \
            --with-installed-readline

make

chown -Rv tester .

su tester &lt;&lt; EOF
PATH=$PATH make tests &lt; $(tty)
EOF

make install
mv -vf /usr/bin/bash /bin

exec /bin/bash --login +h

