# green

## Manual steps

```bash
pkg upgrade
passwd -d
termux-setup-storage
pkg install openssh
cat storage/shared/id_ed25519.pub >> .ssh/authorized_keys
cp $PREFIX/etc/ssh/ssh_host_ed25519_key.pub storage/shared/

id
sshd
```

Connect to ssh: `ssh -p 8022 user@green`

```bash
ssh-keygen
```

## Start yadm branch

```bash
yadm clone -w /data/data/com.termux/files/ -b blue --no-checkout git@github.com:Gonzalocl/dotfiles.git
yadm switch --orphan green
```
