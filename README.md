# SiYuan Flatpak

This distribution is maintained by volunteers, not by SiYuan team.

Upstream repository: https://github.com/siyuan-note/siyuan

## Wayland support

Wayland is disabled by default for compatibility reasons. It can be enabled by setting the environment variable `--socket=wayland` either using [Flatseal](https://flathub.org/apps/com.github.tchx84.Flatseal), or the command line, like so:

```
$ flatpak override --user --socket=wayland org.b3log.siyuan
```

Wayland support can also be temporarily enabled for a single run:

```
$ flatpak run --socket=wayland org.b3log.siyuan
```

## Known issues

### Broken functionality on Wayland

There are some features that don't yet work in Electron-based applications, including SiYuan, when running as a native Wayland client:

1. Input method frameworks
    * IBus with GNOME: **[does not work](https://github.com/flathub/md.obsidian.Obsidian/issues/317)**.
    * IBus with KDE Plasma: **[does not work as candidate window is misplaced](https://discuss.kde.org/t/ibus-candidate-window-is-misplaced-for-some-apps/3579)**.
    * Fcitx5 with GNOME: **does not work**.
    * Fcitx5 with KDE Plasma: **[works now if configured correctly](https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland#KDE%20Plasma)**.

work in progress…

### Sandbox filesystem limitation

SiYuan of flathub version is limited to read and write to user's home due to 
using flatpak sandbox environment. Defaultly, users only have read premission 
to import their media files from `~/Videos`,
`~/Pictures` and `~/Music`. And read-write premission of `~/Desktop`, `~/Documents` 
and `~/Downloads`, so users can still export document files like pdf or create 
a new workspace in those folders.

For users who installed SiYuan before this breaking change, they have two ways 
to recover previous workspace:

- Under your host filesystem, you can move `~/SiYuan` to `~/Documents/SiYuan` 
  and open this workspace via `Workspaces` function in SiYuan menu.
- Copying folder `~/SiYuan` to `~/.var/app/org.b3log.siyuan/SiYuan`, 
  but don't forget to clean up `~/.var/app/org.b3log.siyuan/SiYuan` to empty 
  before doing this.
