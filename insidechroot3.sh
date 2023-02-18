
export LFS=""
cd /sources

# CHAPTER 8
for package in Python acl attr autoconf automake bash bc binutils bison bzip2 check coreutils \
    dejagnu diffutils e2fsprogs eudev expat expect file findutils flex gawk gcc gdbm gettext \
    glibc gmp gperf grep groff grub gzip iana-etc inetutils intltool iproute2 kbd kmod less \
    libcap libelf libffi libpipeline libtool m4 make man-db man-pages meson mpc mpfr ncurses \
    ninja openssl patch perl pkg-config pkgmgt procps-ng psmisc readline revisedchroot sed shadow \
    strippingagain sysklogd sysvinit tar tcl texinfo util-linux vim xml-parse; do
    
    echo -n ""
    # source packageinstall.sh 8 $package

done