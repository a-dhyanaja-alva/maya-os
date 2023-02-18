./configure --prefix=/usr --disable-debuginfod --libdir=/lib

make

make check

make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /lib/libelf.a

