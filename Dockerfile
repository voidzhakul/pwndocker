FROM ubuntu:22.04

RUN echo 'Acquire::Retries "3";' > /etc/apt/apt.conf.d/80-retries

RUN apt-get -y update && \
    apt-get install -y lib32z1 apt-transport-https python3 python3-pip git \
    libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev xxd file \
    vim nano netcat unzip make wget strace ltrace ruby ruby-dev build-essential \
    curl qemu qemu-system-x86 gcc gdb gdb-multiarch clang lldb tmux 

RUN python3 -m pip install -U pip && \
    python3 -m pip install --no-cache-dir \
    pwntools \
    ropgadget \
    z3-solver \
    smmap2 \
    apscheduler \
    ropper \
    unicorn \
    keystone-engine \
    capstone \
    angr \
    pebble \
    r2pipe \
    LibcSearcher

RUN gem install one_gadget seccomp-tools

RUN git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh

COPY linux* /IDAserver/
RUN chmod +x /IDAserver/linux*

CMD ["/bin/bash"]