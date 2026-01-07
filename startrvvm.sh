#!/usr/bin/bash
#
# SPDX-FileCopyrightText: 2022 Celeste Liu <coelacanthus@outlook.com>
# SPDX-FileCopyrightText: 2025 Kurchatova Eva <lekkit@at.encryp.ch>
# SPDX-License-Identifier: GPL-3.0-or-later

# Install rvvm-git from AUR

# shellcheck disable=1091
. /usr/share/makepkg/util.sh
colorize

parse-args() {
    local OPTIND=1
    shift "$(( OPTIND-1 ))"
    file=${1:-archriscv.img}
}

parse-args "$@"

if [ ! -f './fw_payload.bin' ] || [ ! -f "$file" ]
then
msg "Building boot images"
./mkrootfs -i nano -i htop -i fastfestch
./mkimg -c "audit=0 loglevel=6 console=ttyS0 console=tty0" -l 64G "$file"
fi

msg "Starting RVVM"
rvvm \
    -smp 8 \
    -m 4G \
    -res 1280x720 \
    -portfwd 2022=22 \
    -jitcache 128M \
    -bios ./fw_payload.bin \
    -nvme "$file"
