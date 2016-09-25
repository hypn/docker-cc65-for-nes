# Usage

An image containing "cc65" (see http://cc65.github.io/cc65/) specifically intended for complining NES games written in C as per https://nesdoug.com/ tutorials.

To run this container:

    docker run --rm -ti -v {code_path}:/src hypnza/cc65_for_nes bash

Binaries are install to "/usr/bin", eg:

    /usr/bin/cc65
    /usr/bin/ca65
    /usr/bin/ld65


Example compilation of nesdoug's "lesson1" :

    root@hash:/src/lesson1# cc65 -Oi lesson1.c --add-source
    root@hash:/src/lesson1# ca65 reset.s
    root@hash:/src/lesson1# ca65 lesson1.s
    root@hash:/src/lesson1# ld65 -C nes.cfg -o docker-test.nes reset.o lesson1.o nes.lib

    root@hash:/src/lesson1# ls -l docker-test.nes
    -rw-r--r-- 1 1000 staff 24592 Sep 25 09:18 docker-test.nes


A "compile_nes.sh" script is provided in /tmp to automate the above:

    root@hash:/src/lesson1# cd /src/lesson1
    root@hash:/src/lesson1# /tmp/compile_nes.sh lesson1
    Done compiling lesson1.c to lesson1.nes!

