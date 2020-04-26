FROM ubuntu:18.04
LABEL maintainer="zhakul@qq.com"

COPY sources.list /etc/apt/sources.list            

RUN dpkg --add-architecture i386 && \
    apt -y update && \
    apt install -y \
    libc6-dbg libc6:i386 libc6-dbg:i386 glibc-source \
    vim git tmux file xxd \
    net-tools iputils-ping  curl wget \
    netcat socat \
    python2.7 python-pip python-dev libssl-dev libffi-dev build-essential \
    ruby ruby-dev \
    gdb  gdb-multiarch \
    gcc-multilib \
    nasm \
    strace ltrace  \
    qemu qemu-system qemu-user-static binfmt-support && \
    rm -rf /var/lib/apt/lists/*

COPY  pip.conf /etc/pip.conf

RUN pip install pwntools 

RUN git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh

RUN gem install one_gadget seccomp-tools

COPY linux* /IDAserver/

RUN chmod +x /IDAserver/linux*

CMD ["/bin/bash"]