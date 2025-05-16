# green

## Manual steps

```bash
termux-change-repo
pkg upgrade
termux-setup-storage
read -p "Continue?"
pkg install yadm
yadm clone -w /data/data/com.termux/files/ -b green --bootstrap https://github.com/Gonzalocl/dotfiles.git
```


## Start yadm branch

```bash
yadm clone -w /data/data/com.termux/files/ -b blue --no-checkout git@github.com:Gonzalocl/dotfiles.git
yadm switch --orphan green
```
