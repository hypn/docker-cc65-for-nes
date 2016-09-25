FROM    ubuntu

RUN     apt-get update
RUN     apt-get install -y wget

# see http://software.opensuse.org/download.html?project=home%3Astrik&package=cc65
RUN     wget http://download.opensuse.org/repositories/home:strik/Debian_8.0/Release.key -O /tmp/opensuse.key
RUN     apt-key add - < /tmp/opensuse.key
RUN     echo 'deb http://download.opensuse.org/repositories/home:/strik/Debian_8.0/ /' >> /etc/apt/sources.list.d/cc65.list
RUN     apt-get update
RUN     apt-get install -y --allow-unauthenticated cc65

RUN     rm -rf /var/lib/apt/lists/*

COPY    compile_nes.sh /tmp/compile_nes.sh
