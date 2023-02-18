
make mrproper

make defconfig

make -j8

make modules_install

cp -iv arch/x86/boot/bzImage /boot/vmlinuz-5.8.3-lfs-10.0
cp -iv System.map /boot/System.map-5.8.3
cp -iv .config /boot/config-5.8.3

install -d /usr/share/doc/linux-5.8.3
cp -r Documentation/* /usr/share/doc/linux-5.8.3
