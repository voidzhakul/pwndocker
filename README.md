# Pwndocker

基于Ubuntu22.04制作的一个用于PWN的docker镜像

## Tools

- tmux
- xxd
- gdb(gdb-multiarch)
- pwndbg
- pwntools
- ROPgadget
- one_gadget
- nasm
- strace
- ltrace
- qemu
- Linux_server(IDA7.4)

## Use

### Build by yourself

```bash
docker build -t pwndocker .
docker run -it --rm -v $(pwd):/pwnfile --privileged pwndocker /bin/bash
```

### 关于gdb.attach()

在docker下脚本中直接`gdb.attach()`并不能弹出终端用于gdb调试  
利用tmux可解决此问题  
同时建议在`gdb.attach()`前，制定一下终端参数与类型`context.terminal=['tmux','split-window','-h']`
