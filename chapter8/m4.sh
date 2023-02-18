sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" &gt;&gt; lib/stdio-impl.h

export CFLAGS=' -Wabi=11 -fpermissive '

./configure --prefix=/usr

make

make check

make install

