# download iso and sig
pacman-key -v archlinux-2020.09.01-x86_64.iso.sig
sha1sum archlinux-2020.09.01-x86_64.iso
lsblk
lsblk
sudo wipefs -a /dev/sdb
sudo dd if=archlinux-2020.09.01-x86_64.iso of=/dev/sdb bs=4M oflag=sync status=progress
sync
lsblk




ls /usr/share/kbd/keymaps/**/*.map.gz | less
loadkeys es

head /etc/pacman.d/mirrorlist

systemctl status systemd-resolved.service
systemctl status systemd-networkd.service
systemctl status iwd.service
ip link
rfkill list
iwctl device list
iwctl station wlan0 scan
iwctl station wlan0 get-networks
iwctl station wlan0 connect cienfuegos
ping 1.1.1.1
networkctl list

passwd

# PermitRootLogin yes
vim /etc/ssh/sshd_config

systemctl status sshd.service
systemctl start sshd.service

ip addr
exit

ssh root@archiso

head /etc/pacman.d/mirrorlist

date
timedatectl status
timedatectl set-ntp true
date
timedatectl status

e2fsck -f /dev/sda1
resize2fs /dev/sda1 75G
parted /dev/sda
resizepart 1 82GiB
quit
fdisk -l /dev/sda
resizepart /dev/sda 1 171964416

lsblk
fdisk /dev/sda
F
n
w
lsblk
fdisk -l /dev/sda
mkfs.ext4 /dev/sda2
mount /dev/sda2 /mnt

less /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware

cat /mnt/etc/fstab
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
ls -l /dev/disk/by-uuid

arch-chroot /mnt

date
ls -l /etc/localtime
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
date
ls -l /etc/localtime

cat /etc/adjtime
hwclock --systohc
cat /etc/adjtime
date

pacman -Syu
pacman -S vim

grep -v "^#" /etc/locale.gen
vim /etc/locale.gen
grep -v "^#" /etc/locale.gen
locale-gen
date

cat /etc/locale.conf
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
cat /etc/locale.conf

cat /etc/vconsole.conf
echo 'KEYMAP=es' > /etc/vconsole.conf
cat /etc/vconsole.conf

cat /etc/hostname
echo 'red' > /etc/hostname
cat /etc/hostname

cat /etc/hosts
echo '127.0.0.1 localhost
::1 localhost
127.0.1.1 red.local red' >> /etc/hosts
cat /etc/hosts

pacman -S iwd
mkdir /etc/iwd
echo '[General]
EnableNetworkConfiguration=true

[Network]
NameResolvingService=systemd
' > /etc/iwd/main.conf
cat /etc/resolv.conf
echo "nameserver 192.168.1.1" >> /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf
cat /etc/resolv.conf

passwd

pacman -S grub
pacman -S intel-ucode
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

exit
umount -R /mnt
poweroff

grep wheel /etc/group
grep storage /etc/group
grep power /etc/group
useradd -m -G wheel,storage,power -s /bin/bash gonzalo
grep wheel /etc/group
grep storage /etc/group
grep power /etc/group
passwd gonzalo

iwctl station wlan0 scan
iwctl station wlan0 connect cienfuegos

pacman -S openssh
systemctl start sshd
exit

ssh 192.168.1.10

date
timedatectl status
lsblk
head /etc/pacman.d/mirrorlist
cat /etc/fstab
cat /etc/localtime
cat /etc/adjtime
grep -v "^#" /etc/locale.gen
cat /etc/locale.conf
cat /etc/vconsole.conf
cat /etc/hostname
cat /etc/hosts

mkdir systemd-analyze-out
systemd-analyze blame > systemd-analyze-out/blame.txt
systemd-analyze critical-chain > systemd-analyze-out/critical-chain.txt
systemd-analyze plot  > systemd-analyze-out/plot.svg
systemd-analyze > systemd-analyze-out/systemd-analyze.txt

su -l
pacman -S sudo
sudo -lU gonzalo

# ver c

sudo systemctl disable iwd
sudo systemctl enable NetworkManager
sudo reboot
startx
nm-connection-editor
exit




# TODO https://wiki.archlinux.org/index.php/Sudo#Configure_sudo_using_drop-in_files_in_/etc/sudoers.d

EDITOR=vim visudo
sudo -lU gonzalo
exit

# https://wiki.archlinux.org/index.php/Sudo#Using_visudo
# Reset environment by default
Defaults      env_reset
# Set default EDITOR to nano, and do not allow visudo to use EDITOR/VISUAL.
Defaults      editor=/usr/bin/nano, !env_editor

%wheel      ALL=(ALL) ALL

Defaults insults

# TODO https://wiki.archlinux.org/index.php/Sudo#Disable_root_login
# TODO https://wiki.archlinux.org/index.php/Sudo#Harden_with_sudo_example


# ver que ficheros maneja nm


# next sudo
# after xorg install, network set eth, disable iwd, install graphical tool, enable graphical tool, configure graphical tool



# al final comprobar que le ssh no root





#https://wiki.archlinux.org/index.php/Network_configuration#Set_the_hostname
#To set the "pretty" hostname and other machine metadata, see machine-info(5).

#https://wiki.archlinux.org/index.php/Network_configuration#Local_network_hostname_resolution

#https://wiki.archlinux.org/index.php/Iwd#Eduroam
#https://wiki.archlinux.org/index.php/Network_configuration/Wireless#eduroam






#https://wiki.archlinux.org/index.php/Iwd
#https://wiki.archlinux.org/index.php/Network_configuration
#https://wiki.archlinux.org/index.php/Network_configuration/Wireless

#https://wiki.archlinux.org/index.php/Arch_boot_process

#https://wiki.archlinux.org/index.php/GRUB

#https://wiki.archlinux.org/index.php/Microcode




#https://wiki.archlinux.org/index.php/NetworkManager
#https://wiki.archlinux.org/index.php/Systemd#Boot_time_increasing_over_time
#https://wiki.archlinux.org/index.php/General_recommendations#System_maintenance
#https://wiki.archlinux.org/index.php/Microcode#Verifying_that_microcode_got_updated_on_boot
"


# more 
sudo pacman -S tiguervnc
scp .vnc/passwd 192.168.1.10:
mkdir .vnc
mv passwd .vnc
vncviewer 192.168.1.33:4 -passwd .vnc/passwd



