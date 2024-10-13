# SiYuan Flatpak

This distribution is maintained by volunteers, not by SiYuan team.

Upstream repository: https://github.com/siyuan-note/siyuan .

## ⚠️NOTICE⚠️ ##

Since version 3.1.8, SiYuan Flatpak is required to use `$XDG_CONFIG_HOME` instead of `$HOME due to` the Flatpak sandbox.  
See: https://github.com/flathub/org.b3log.siyuan/issues/47 .

This breaking change will alter the workspace locations for users who already installed SiYuan Flatpak.

Following this update, the default **absolute paths** used by SiYuan Flatpak will change, as shown in the table below:

|USED AS|BEFORE|NOW|
|:-------|:-------------------------|:---------------------------------------------------|
|Workspace|`~/SiYuan`|`~/.var/app/org.b3log.siyuan/SiYuan`|
|Configuration|`~/.config/siyuan`|`~/.var/app/org.b3log.siyuan/.config/siyuan`|
|Configuration|`~/.config/SiYuan`|`~/.var/app/org.b3log.siyuan/.config/SiYuan`|
|Configuration|`~/.config/SiYuan-Electron`|`~/.var/app/org.b3log.siyuan/.config/SiYuan-Electron`|

Users need to copy and overwrite their data to the new paths.

Alternatively, users can migrate their workspace to `~/Documents/SiYuan` and open the new workspace in the menu.

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

Work in progress…

### Flatpak sandbox limitation

SiYuan Flatpak faces restrictions when reading or writing to users' home directories due to the Flatpak sandbox.  
See: https://github.com/flathub/org.b3log.siyuan/issues/47 .

By default, users now only have read access in these directories:
- `~/Videos`
- `~/Pictures`
- `~/Music`

and have read/write access in these directories:
- `~/Desktop`
- `~/Documents`
- `~/Downloads`

So, users can only export documents, such as PDFs, or create a new workspace in the three directories above.
