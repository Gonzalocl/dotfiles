#TODO set up usb


ls /usr/share/kbd/keymaps/**/*.map.gz | less
loadkeys es

ls /sys/firmware/efi/efivars
efivar -l

cat /etc/pacman.d/mirrorlist

#TODO check /etc/systemd/network
#TODO check /etc/iwd/main.conf
systemctl status systemd-resolved.service
systemctl status systemd-networkd.service
systemctl status iwd.service
#TODO start services
ip link
rfkill list
iwctl device list
iwctl station wlan0 scan
iwctl station wlan0 get-networks
iwctl station wlan0 connect cienfuegos
ping 1.1.1.1
networkctl list

date
timedatectl status
timedatectl set-ntp true
date
timedatectl status

dd if=/dev/zero of=/dev/sda bs=1M count=10 status=progress oflag=sync
fdisk /dev/sda
#TODO
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

cat /etc/pacman.d/mirrorlist
pacstrap /mnt base linux linux-firmware

cat /mnt/etc/fstab
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

arch-chroot /mnt

date
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
date

cat /etc/adjtime
hwclock --systohc
cat /etc/adjtime
date

pacman -Syu
pacman -S vim

# uncomment en_US.UTF-8 UTF-8
vim /etc/locale.gen
locale-gen
grep -v "^#" /etc/locale.gen
date

cat /etc/locale.conf
# LANG=en_US.UTF-8
vim /etc/locale.conf
cat /etc/locale.conf

cat /etc/vconsole.conf
# KEYMAP=es
vim /etc/vconsole.conf
cat /etc/vconsole.conf

cat /etc/hostname
# blue
vim /etc/hostname
cat /etc/hostname

cat /etc/hosts
# 127.0.0.1 localhost
# ::1 localhost
# 127.0.1.1 blue.local blue
vim /etc/hosts
cat /etc/hosts

passwd

efivar --list
ls /sys/firmware/efi/efivars

ls /boot
bootctl install
ls /boot
cat /boot/loader/entries/arch.conf
# title Arch Linux
# linux /vmlinuz-linux
# initrd /initramfs-linux.img
vim /boot/loader/entries/arch.conf
cat /boot/loader/entries/arch.conf
blkid -s PARTUUID -o value /dev/sda2
echo "options root=PARTUUID=$(blkid -s PARTUUID -o value /dev/sda2) rw" >> /boot/loader/entries/arch.conf
cat /boot/loader/entries/arch.conf
vim /boot/loader/entries/arch.conf
bootctl list

pacman -S intel-ucode
# add line
# initrd /intel-ucode.img
vim /boot/loader/entries/arch.conf
cat /boot/loader/entries/arch.conf
# title Arch Linux
# linux /vmlinuz-linux
# initrd /intel-ucode.img
# initrd /initramfs-linux.img
# options root=PARTUUID=e0e46474-16db-7346-b380-a381e53639a1 rw
bootctl list
#TODO hook and conf https://wiki.archlinux.org/index.php/Systemd-boot

#TODO install iw etc
pacman -S iwd

exit
umount -R /mnt
poweroff
# remove USB and reboot

# check previous settings
ls /sys/firmware/efi/efivars
efivar -l
date
timedatectl status
lsblk
cat /etc/pacman.d/mirrorlist
cat /mnt/etc/fstab
cat /etc/localtime
cat /etc/adjtime
grep -v "^#" /etc/locale.gen
cat /etc/locale.conf
cat /etc/vconsole.conf
cat /etc/hostname
cat /etc/hosts
bootctl list

# log systemd-analyze
mkdir /home/systemd-analyze-out
systemd-analyze blame > /home/systemd-analyze-out/blame.txt
systemd-analyze critical-chain > /home/systemd-analyze-out/cc.txt
systemd-analyze plot  > /home/systemd-analyze-out/plot.svg
systemd-analyze > /home/systemd-analyze-out/sysanalyze.txt





#TODO needed?
echo '[Match]
Name=wlan0

[Network]
DHCP=yes' > /etc/systemd/network/25-wireless.network
systemctl restart systemd-networkd.service
# TODO or
echo '[General]
EnableNetworkConfiguration=true

[Network]
NameResolvingService=systemd
' > /etc/iwd/main.conf
# TODO

systemctl status systemd-resolved.service
systemctl status systemd-networkd.service
systemctl status iwd.service
#TODO start services
ip link
rfkill list
iwctl device list
iwctl station wlan0 scan
iwctl station wlan0 get-networks
iwctl station wlan0 connect cienfuegos
ping 1.1.1.1
networkctl list

grep wheel /etc/group
grep storage /etc/group
grep power /etc/group
useradd -m -G wheel,storage,power -s /bin/bash gonzalo
grep wheel /etc/group
grep storage /etc/group
grep power /etc/group
passwd gonzalo

pacman -S sudo
# TODO uncomment wheels?
# TODO set default editor https://wiki.archlinux.org/index.php/Sudo#Using_visudo
# TODO https://wiki.archlinux.org/index.php/Sudo#Disable_root_login
# TODO https://wiki.archlinux.org/index.php/Sudo#Configure_sudo_using_drop-in_files_in_/etc/sudoers.d
# TODO https://wiki.archlinux.org/index.php/Sudo#Harden_with_sudo_example
EDITOR=vim visudo

exit
# login as gonzalo

sudo systemctl status fstrim.timer
sudo systemctl enable fstrim.timer
sudo systemctl status fstrim.timer

# [multilib]
# Include = /etc/pacman.d/mirrorlist
sudo vim /etc/pacman.conf
sudo pacman -Syu

# TODO pcaman build optimize makepkg
sudo pacman -S --needed base-devel
# see makepkg.conf
# set cflas, makeflas, xz threads
sudo vim /etc/makepkg.conf

# TODO https://wiki.archlinux.org/index.php/General_recommendations#Hardware_auto-recognition

# next
# TODO Num Lock activation

sudo pacman -S xorg-server xorg-apps xorg-xinit xorg-twm xorg-xclock xterm
# check it is ok and close
startx

sudo pacman -S mesa lib32-mesa
sudo pacman -S mesa-demos

# TODO test
sudo pacman -S vulkan-icd-loader lib32-vulkan-icd-loader vulkan-intel lib32-vulkan-intel
ls /usr/share/vulkan/icd.d/

# https://wiki.archlinux.org/index.php/Hardware_video_acceleration

# https://wiki.archlinux.org/index.php/Intel_graphics#Loading
# https://wiki.archlinux.org/index.php/Kernel_mode_setting

# https://wiki.archlinux.org/index.php/Intel_graphics#Module-based_options

# https://wiki.archlinux.org/index.php/Intel_graphics#Hardware_accelerated_H.264_decoding_on_GMA_4500

# https://wiki.archlinux.org/index.php/Backlight


glxinfo | grep "OpenGL renderer"
vulkaninfo
sudo pacman -S nvidea nvidea-utils lib32-nvidea-utils
glxinfo | grep "OpenGL renderer"
vulkaninfo

# TODO needed?
sudo pacman -S pkgconfig

sudo pacman -S  nvidia-settings

# https://wiki.archlinux.org/index.php/NVIDIA

sudo pacman -S nvidia-prime
glxinfo | grep "OpenGL renderer"
vulkaninfo
sudo reboot
glxinfo | grep "OpenGL renderer"
vulkaninfo
prime-run glxinfo | grep "OpenGL renderer"
prime-run vulkaninfo


####







# bash auto
sudo pacman -S bash-completion

# docker
sudo pacman -S docker
sudo usermod -aG docker gonzalo

# alias













































































sudo pacman -S xf86-input-synaptics

sudo nano /etc/makepkg.conf
MAKEFLAGS="-j17 -l16"

# comprobar el sha del usba al final







# Logging in as root for prolonged periods of time, possibly even exposing it via SSH on a server, is insecure

# https://wiki.archlinux.org/index.php/Iwd#Eduroam
# https://wiki.archlinux.org/index.php/Autostarting
# https://wiki.archlinux.org/index.php/Environment_variables
# https://wiki.archlinux.org/index.php/Kernel_mode_setting With Kernel Mode Setting (KMS), the kernel is now able to set the mode of the video card. This makes fancy graphics during bootup, virtual console and X fast switching possible, among other things
# https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate
# https://wiki.archlinux.org/index.php/NVIDIA/Tips_and_tricks
# https://wiki.archlinux.org/index.php/OpenSSH#Deny
# https://wiki.archlinux.org/index.php/Sudo#Enable_insults
# https://wiki.archlinux.org/index.php/Frequently_asked_questions#Package_management
# https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks
# https://wiki.archlinux.org/index.php/System_maintenance
# https://wiki.archlinux.org/index.php/Security
# 
# 
# nvidia-xconfig -o /etc/X11/xorg.conf.d/20-nvidia.conf
# https://wiki.archlinux.org/index.php/NVIDIA#Configuration
# 

# https://wiki.archlinux.org/index.php/Security#SSH
# https://wiki.archlinux.org/index.php/OpenSSH#Force_public_key_authentication



# https://wiki.archlinux.org/index.php/NetworkManager
bluetooth y hotspot





