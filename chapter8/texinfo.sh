./configure --prefix=/usr --disable-static

make

# make check

make install

make TEXMF=/usr/share/texmf install-tex

pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2&gt;/dev/null
  done
popd

