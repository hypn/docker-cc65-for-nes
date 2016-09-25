#!/bin/bash
# derived from nesdoug's "compile.bat" script

if [ "$#" -ne 1 ]; then
    echo "Please specify the filename (without the extension) to compile."
    echo "  eg: \"/tmp/compile_nes.sh lesson1\""
    echo

else

    if [ -f "$1.c" ]
    then
        cc65 -Oi $1.c --add-source
        ca65 reset.s
        ca65 $1.s
        ld65 -C nes.cfg -o $1.nes reset.o $1.o nes.lib

        echo "Done compiling $1.c to $1.nes!"
        echo

    else
        echo "File: $1.c not found!"
        echo
    fi
fi
