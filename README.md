# Arch RISC-V Scriptlet

Useful scripts for building and running Arch RISC-V QCOW2 / raw image.

## Prerequisite

* arch-install-scripts
* parted
* git
* qemu-img
* qemu-system-riscv or rvvm ([AUR](https://aur.archlinux.org/packages/rvvm-git))
* riscv64-linux-gnu-gcc
* devtools-riscv64 ([AUR](https://aur.archlinux.org/packages/devtools-riscv64))

## Build Step

```bash
./mkrootfs
./mkimg [image file]
```

## Start QEMU

```bash
./startqemu.sh [qcow image file]
```

## Start RVVM

```bash
./startrvvm.sh [raw image file]
```
