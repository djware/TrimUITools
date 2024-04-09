#!/bin/sh

rom_base_dir="/mnt/SDCARD/Roms"
emu_base_dir="/mnt/SDCARD/Emus"

RANDOM=$(date '+%s')

emu_dirs=$(find "$emu_base_dir" -mindepth 1 -maxdepth 1 -type d)
emu_count=$(echo "$emu_dirs" | wc -l)

if [ "$emu_count" -eq 0 ]; then
    exit 1
fi

rand_emu_index=$((RANDOM % emu_count + 1))
selected_emu_dir=$(echo "$emu_dirs" | sed -n "${rand_emu_index}p")
selected_emu_name=$(basename "$selected_emu_dir")

rom_dir="$rom_base_dir/$selected_emu_name"

rom_files=$(find "$rom_dir" -type f)
rom_count=$(echo "$rom_files" | wc -l)

if [ "$rom_count" -eq 0 ]; then
    exit 1
fi

rand_rom_index=$((RANDOM % rom_count + 1))
selected_rom=$(echo "$rom_files" | sed -n "${rand_rom_index}p")

cd "$selected_emu_dir" && sh "./launch.sh" "$selected_rom"

