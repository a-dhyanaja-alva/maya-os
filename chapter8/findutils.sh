./configure --prefix=/usr --localstatedir=/var/lib/locate

make

chown -Rv tester .
su tester -c "PATH=$PATH make check"

make install

mv -v /usr/bin/find /bin
sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb

