# Install

```bash
sudo locale-gen
sudo systemctl enable pkgfile-update.timer

mkdir -p .config/clipcat
clipcatd default-config >.config/clipcat/clipcatd.toml
clipcatctl default-config >.config/clipcat/clipcatctl.toml
clipcat-menu default-config >.config/clipcat/clipcat-menu.toml
```
