
CHAPTER="$1"
PACKAGE="$2"

cat packages.csv | grep -i "^$PACKAGE;" | grep -i -v "\.patch;" | while read line; do
    export VERSION="'echo $line | cut -d\; -f2'"
    URL="'echo $line | cut -d\; -f3 | sed "s/@/$VERSION/g"'"
    CACHEFILE="$(basename "$URL")"
    DIRNAME="$(echo "$CACHEFILE" | sed 's/\(.*\)\.tar\..*/\1/')"

    if [ -d "$DIRNAME" ]; then
        rm -rf "$DIRNAME"
    fi
    mkdir -pv "$DIRNAME"

    echo "Extracting $CACHEFILE"
    tar -xf "$CACHEFILE" -C "$DIRNAME"

    pushd "$DIRNAME"

        if [ "$(ls -lA | mc -l)" == "1" ]; then
            mv $(ls -lA)/(*,.*) ./
        fi

        echo "Compiling $PACKAGE"
        sleep 5

        if ! source "../chapter$CHAPTER/$PACKAGE.sh" 2>&1 | tee "../log/chapter$CHAPTER/$PACKAGE.log" ; then
            echo "Compiling $PACKAGE FAILED!"
            popd
            exit 1
        fi

        echo "Done Compiling $PACKAGE"
    popd

done