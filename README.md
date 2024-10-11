# SiYuan Flatpak

## Sandbox filesystem limitation

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
