#!/bin/bash

set -oue pipefail

WORKSPACE_CONFIG_FILE="/home/$USER/.config/siyuan/workspace.json"

# Creating default workspace configuration when first time opening SiYuan
# then Siyuan will initialize directly.
#
# For users who installed SiYuan, please copy folder `~/SiYuan` in host
# to `~/.var/app/org.b3log.siyuan/SiYuan` to recover your data, but dont
# forget to clean up `~/.var/app/org.b3log.siyuan/SiYuan` to empty at first.
if [ ! -s "$WORKSPACE_CONFIG_FILE" ]; then
    echo "[\"/home/$USER/SiYuan\"]" > "$WORKSPACE_CONFIG_FILE";
fi

EXTRA_ARGS=(--enable-features=Vulkan)

# Wayland support can be optionally enabled like so:
# flatpak override --user --socket=wayland org.b3log.siyuan

WL_DISPLAY="${WAYLAND_DISPLAY:-"wayland-0"}"
# Some compositors a real path a instead of a symlink for WAYLAND_DISPLAY:
# https://github.com/flathub/md.obsidian.Obsidian/issues/284
if [[ -e "${XDG_RUNTIME_DIR}/${WL_DISPLAY}" || -e "/${WL_DISPLAY}" ]]; then
    echo "Debug: Enabling Wayland backend"
    EXTRA_ARGS+=(
        --ozone-platform-hint=auto
        --enable-features=UseOzonePlatform,WaylandWindowDecorations
        --enable-wayland-ime
    )
fi

echo "Debug: Will run Siyuan with the following arguments: ${EXTRA_ARGS[@]}"
echo "Debug: Additionally, user gave: $@"

export FLATPAK_ID="${FLATPAK_ID:-org.b3log.siyuan}"
export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"

zypak-wrapper /app/siyuan/siyuan $@ ${EXTRA_ARGS[@]}
