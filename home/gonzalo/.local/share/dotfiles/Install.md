# Install

```
sudo locale-gen
sudo systemctl enable pkgfile-update.timer

systemctl --user enable org.gnome.GPaste.service
gsettings set org.gnome.GPaste growing-lines true
gsettings set org.gnome.GPaste open-centered true
gsettings set org.gnome.GPaste primary-to-history true
gsettings set org.gnome.GPaste synchronize-clipboards true
```
