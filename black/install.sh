# download iso and sig
pacman-key -v archlinux-2020.12.01-x86_64.iso.sig
sha1sum archlinux-2020.12.01-x86_64.iso
lsblk
# insert usb
lsblk
sudo wipefs -a /dev/sdb
sudo dd if=archlinux-2020.12.01-x86_64.iso of=/dev/sdb bs=4M oflag=sync status=progress
sync
lsblk
# remove usb


# insert usb
# power on
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
iwctl station wlan0 connect 100fuegos
ping 1.1.1.1
networkctl list

passwd

# PermitRootLogin yes
vim /etc/ssh/sshd_config

systemctl status sshd.service
systemctl start sshd.service

ip addr








ping archiso
ssh root@192.168.1.11

head /etc/pacman.d/mirrorlist
smartctl -a /dev/sda > 2020_12_09
scp root@192.168.1.11:2020_12_09 2020_12_09

ls /sys/firmware/efi/efivars
efivar -l

date
timedatectl status
timedatectl set-ntp true
date
timedatectl status

lsblk
fdisk -l
wipefs -a /dev/sda
lsblk
fdisk -l

fdisk /dev/sda
m
p
F
g
n
enter
enter
+512M
n
enter
enter
+40GBM
n
enter
enter
enter
t
1
L
1
t
2
20
t
3
28
p
F
v
w
lsblk
fdisk -l /dev/sda
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
mount /dev/sda2 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/sda1 /mnt/boot
mount /dev/sda3 /mnt/home

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
echo 'black' > /etc/hostname
cat /etc/hostname

cat /etc/hosts
echo '127.0.0.1 localhost
::1 localhost
127.0.1.1 black.local black' >> /etc/hosts
cat /etc/hosts

pacman -S networkmanager

passwd

ls /boot
bootctl install
ls /boot
pacman -S intel-ucode
ls /boot
cat /boot/loader/entries/arch.conf
echo 'title Arch Linux
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux.img' > /boot/loader/entries/arch.conf
blkid -s PARTUUID -o value /dev/sda2
echo "options root=PARTUUID=$(blkid -s PARTUUID -o value /dev/sda2) rw" >> /boot/loader/entries/arch.conf
cat /boot/loader/entries/arch.conf
bootctl list
#TODO hook and conf https://wiki.archlinux.org/index.php/Systemd-boot

pacman -S etckeeper
git config --global user.email "gonzalocl1024@gmail.com"
git config --global user.name "Gonzalo Caparrós Laiz"
etckeeper init
etckeeper commit "first commit"

grep wheel /etc/group
grep storage /etc/group
grep power /etc/group

useradd -m -G storage,power -s /bin/bash luna3
useradd -m -G wheel,storage,power -s /bin/bash gonzalo
useradd -m -G storage,power -s /bin/bash camilo
passwd gonzalo

grep wheel /etc/group
grep storage /etc/group
grep power /etc/group
ls -l /home/

etckeeper vcs status
etckeeper commit "user add luna3 gonzalo camilo"

pacman -S sudo
sudo -lU luna3
sudo -lU camilo
sudo -lU gonzalo
EDITOR=vim visudo

'Defaults env_reset
Defaults editor=/usr/bin/vim, !env_editor

%wheel ALL=(ALL) ALL

Defaults insults'
EDITOR=vim visudo -f /etc/sudoers.d/20_sudo_config
# vim paste shift insert
sudo -lU luna3
sudo -lU camilo
sudo -lU gonzalo
ls -l /etc/sudoers

etckeeper vcs status
etckeeper commit "sudo config"

exit
umount -R /mnt
exit

poweroff

# trun on with usb to check boot priority
# login gonzalo
lsblk
# remove usb
lsblk

sudo ls
sudo passwd -l root
sudo etckeeper vcs status
sudo etckeeper commit "lock root"

systemctl --type=service
systemctl status NetworkManager.service
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
nmcli device wifi list
nmcli device wifi connect 100fuegos password 'pass'
history -c
nmcli connection show
cat /etc/resolv.conf
sudo etckeeper vcs status
sudo etckeeper commit "wifi"

sudo pacman -S openssh
systemctl status sshd.service
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
sudo etckeeper vcs status
sudo etckeeper commit "start and enable sshd"
ip addr

exit

ssh gonzalo@192.168.1.11

mkdir systemd-analyze-out
cd systemd-analyze-out
systemd-analyze blame > blame.txt
systemd-analyze critical-chain > critical-chain.txt
systemd-analyze plot > plot.svg
systemd-analyze > systemd-analyze.txt

poweroff

# login gonzalo

# check no pass in history
history
sudo -i
history

head /etc/pacman.d/mirrorlist
ls /sys/firmware/efi/efivars
efivar -l
date
timedatectl status
lsblk
sudo fdisk -l
cat /etc/fstab
ls -l /etc/localtime
cat /etc/adjtime
grep -v "^#" /etc/locale.gen
cat /etc/locale.conf
cat /etc/vconsole.conf
cat /etc/hostname
cat /etc/hosts
cat /boot/loader/entries/arch.conf
bootctl list
grep wheel /etc/group
grep storage /etc/group
grep power /etc/group
ls -l /home/
sudo -lU luna3
sudo -lU camilo
sudo -lU gonzalo
visudo -f /etc/sudoers.d/20_sudo_config
ls -l /etc/sudoers
systemctl status NetworkManager.service
nmcli connection show
systemctl status sshd.service

sudo pacman -S bash-completion

# uncomment
# [multilib]
# Include = /etc/pacman.d/mirrorlist
sudo -e /etc/pacman.conf
sudo etckeeper vcs status
sudo etckeeper commit "enable multilib"
sudo pacman -Syu

sudo pacman -S --needed base-devel
# CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fstack-protector-strong -fno-plt"
# CXXFLAGS="${CFLAGS}"
# MAKEFLAGS="-j$(nproc)"
# COMPRESSXZ=(xz -c -z - --threads=0)
# COMPRESSZST=(zstd -c -z -q - --threads=0)
sudo -e /etc/makepkg.conf
sudo etckeeper vcs status
sudo etckeeper commit "makepkg parallel compilation and compression"












mkdir driver_info
lspci -k > driver_info/00_init_lspci
sudo pacman -S xorg xorg-apps xorg-xinit xorg-twm xorg-xclock xterm
# check it is ok and close
startx
lspci -k > driver_info/10_xorg_lspci
exit
reboot

lspci -v | grep -A1 -e VGA -e 3D
sudo pacman -S xf86-video-vesa
startx
lspci -k > driver_info/20_vesa_lspci
exit
reboot

sudo pacman -S xf86-video-fbdev
startx
lspci -k > driver_info/30_fbdev_lspci
exit
reboot

sudo pacman -S mesa lib32-mesa mesa-demos lib32-mesa-demos
startx
lspci -k > driver_info/40_mesa_lspci
glinfo > driver_info/41_mesa_glinfo
glxgears > driver_info/42_mesa_glxgears
glxgears32 > driver_info/43_mesa_glxgears32
exit
reboot

sudo pacman -S vulkan-icd-loader lib32-vulkan-icd-loader vulkan-intel lib32-vulkan-intel vulkan-tools
ls /usr/share/vulkan/icd.d/
startx
lspci -k > driver_info/50_vulkan_lspci
vulkaninfo > driver_info/51_vulkan_vulkaninfo
vkcube > driver_info/52_vulkan_vkcube
exit
reboot

sudo pacman -S cinnamon cinnamon-translations
sudo pacman -S lightdm lightdm-webkit-theme-litarvan

sudo pacman -S numlockx
ls /usr/share/xgreeters
# [Seat:*]
# greeter-session=lightdm-webkit2-greeter
# greeter-setup-script=/usr/bin/numlockx on
sudo -e /etc/lightdm/lightdm.conf

ls /usr/share/lightdm-webkit/themes
# webkit_theme        = litarvan
sudo -e /etc/lightdm/lightdm-webkit2-greeter.conf

sudo systemctl enable lightdm
sudo etckeeper vcs status
sudo etckeeper commit "lightdm"

ls -lah /etc/X11/xorg.conf.d/
localectl
sudo localectl --no-convert set-x11-keymap es
localectl
cat /etc/X11/xorg.conf.d/00-keyboard.conf
sudo etckeeper vcs status
sudo etckeeper commit "set-x11-keymap"

reboot
# https://wiki.archlinux.org/index.php/Cinnamon#Show_home,_filesystem_desktop_icons


sudo pacman -S gnome-screenshot barrier
sudo pacman -S synergy
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
sudo pacman -S gedit totem vlc eog
sudo pacman -S htop
sudo pacman -S telegram-desktop ttf-opensans

sudo pacman -S ttf-liberation xdg-utils
mkdir aur_build
cd aur_build
git clone https://aur.archlinux.org/google-chrome.git
cd google-chrome
gedit * .*
makepkg -sic
cd ..

git clone https://aur.archlinux.org/google-earth-pro.git
cd google-earth-pro
gedit * .*
makepkg -sic
cd ..






# TODO install ntfs
sudo pacman -S arch-install-scripts
lsblk -f
sudo mkdir -p /media/Acer_1E
sudo mkdir -p /media/DATA_DE
sudo mount /dev/sda2 /media/Acer_1E
sudo mount /dev/sda3 /media/DATA_DE
genfstab -U /
sudo umount /dev/sda2
sudo umount /dev/sda3
# TODO check
echo '
UUID=   /media/Acer_1E    ntfs            uid=luna3,gid=luna3,dmask=022,fmask=133   0 0
UUID=   /media/DATA_DE    ntfs            uid=luna3,gid=luna3,dmask=022,fmask=133   0 0
' | sudo tee -a /etc/fstab
cat /etc/fstab
sudo mount /dev/sda2
sudo mount /dev/sda3















# printers

sudo pacman -S cups cups-pdf 
sudo pacman -S gutenprint foomatic-db-gutenprint-ppds
sudo pacman -S foomatic-db-engine foomatic-db foomatic-db-ppds
sudo pacman -S foomatic-db-nonfree foomatic-db-nonfree-ppds
sudo cups-genppdupdate
sudo systemctl start cups.service




# scanner

sudo pacman -S sane-airscan ipp-usb
# sudo systemctl enable ipp-usb.service
sudo pacman -S simple-scan
sudo simple-scan
echo 'ATTRS{idVendor}=="04b8", ATTRS{idProduct}=="0865", MODE="0666"' | sudo tee /etc/udev/rules.d/65-sane-missing-scanner.rules
#echo 'usb
#usb 0x04b8 0x0865' | sudo tee /etc/sane.d/epson-missing-scanner.conf
# echo 'ATTRS{idVendor}=="04b8", ATTRS{idProduct}=="0865", MODE="0664", GROUP="saned", ENV{libsane_matched}="yes"' | sudo tee /etc/udev/rules.d/65-sane-missing-scanner.rules
# sudo usermod -aG lp saned


# reexe lspci


# chrome, gitg, fonts, xdgopen, webkitdm performace, vnc, pdf, vlc, totem, eog, gedit, see already installed, va, keyboard conf, meld, telegram, discord, peek, screenshot shortcut, calculator, google-earth, themes/icons, python, R, imageviewer, print/scan, Rstudio, ark, libre office, msoffice, ngrok
# https://wiki.archlinux.org/index.php/Synergy
# https://wiki.archlinux.org/index.php/Locale
# https://wiki.archlinux.org/index.php/Dotfiles
# https://wiki.archlinux.org/index.php/LightDM



# at the end check all settings

# lib32-libva-mesa-driver

# next
# https://wiki.archlinux.org/index.php/Xorg#Configuration



# TODO locale
# TODO https://wiki.archlinux.org/index.php/General_recommendations#Hardware_auto-recognition
# TODO https://wiki.archlinux.org/index.php/Activating_numlock_on_bootup
# TODO https://wiki.archlinux.org/index.php/Reflector
# TODO check driver in use https://wiki.archlinux.org/index.php/Kernel_mode_setting
# TODO check driver in use; till the end https://wiki.archlinux.org/index.php/Intel_graphics#Loading
# TODO https://wiki.archlinux.org/index.php/Hardware_video_acceleration
# TODO https://wiki.archlinux.org/index.php/Xinit
# TODO https://wiki.archlinux.org/index.php/Xprofile
# TODO till the end https://wiki.archlinux.org/index.php/Xorg#Configuration
# TODO https://wiki.archlinux.org/index.php/Xorg#Display_size_and_DPI
# TODO https://wiki.archlinux.org/index.php/Display_manager#Set_language_for_user_session
# TODO https://wiki.archlinux.org/index.php/Locale



# TODO https://wiki.archlinux.org/index.php/X_resources
# TODO https://wiki.archlinux.org/index.php/Dotfiles
# TODO https://wiki.archlinux.org/index.php/Bluetooth https://wiki.archlinux.org/index.php/Cinnamon#Cinnamon_settings




# TODO systemd?



# https://wiki.archlinux.org/index.php/Sudo#Disable_root_login
# TODO pan wheels
# TODO network group
# TODO sudo -e
# TODO etkeeper fails with archiso
# TODO sshd denay root


# porque recien creada pone que tiene 77m usados
# df -h
# /dev/sda3       1.8T   77M  1.7T   1% /home
# du -sh /home/
# 72K     /home/



# https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Identify_files_not_owned_by_any_package
# https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#Tracking_unowned_files_created_by_packages
# https://wiki.archlinux.org/index.php/Xinit
# https://wiki.archlinux.org/index.php/Xprofile
# https://wiki.archlinux.org/index.php/Cinnamon#Cinnamon_applications
# https://wiki.archlinux.org/index.php/Dotfiles
# https://wiki.archlinux.org/index.php/Dotfiles#User_repositories
# https://wiki.archlinux.org/index.php/X_resources
# https://wiki.archlinux.org/index.php/Screen_capture
# https://wiki.archlinux.org/index.php/Git
# https://wiki.archlinux.org/index.php/Display_manager#Starting_applications_without_a_window_manager
#ls /usr/share/xsessions
#ls /usr/share/xgreeters
#ls /usr/share/backgrounds
#ls /usr/share/lightdm-webkit/themes
# https://wiki.archlinux.org/index.php/Synergy
