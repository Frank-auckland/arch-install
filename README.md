# install arch 
## Check boot method
Use command as follow, if you can see "No such file or directory", you boot is BIOS, otherwise, you boot is EFI. BIOS boot only create root partition, and use grub as bootloader. EFI need to create boot and root partitions.     
```ls /sys/firmware/efi/efivars```    
## Set internet connection
use ```wifi-menu``` to set internet connection.
## Update the system clock
```timedatectl set-ntp true```
## Partition the disks
BIOS can use ```fdisk``` to set partition. EFI use ```cgdisk``` to set GPT partitions. Boot partition select ef00. Root partition use default set (swap partition is option, partition tpye is 8200). Boot use ```mkfs.fat -F32``` to format. Root use ```mkfs.ext4``` to format (```mkswap``` to format swap partition). 
## Mount the file systems
Mount the file system on the root partition to /mnt.    
```mount /dev/sdX1 /mnt```    
EFI Boot need to mount boot partition to /mnt/boot    
```mkdir /mnt/boot```    
```mount /dev/sdX2 /mnt/boot```
## Change mirrorlist
move nearby mirror to top of the list    
```vim /etc/pacman.d/mirrorlist``` to move 
## Install the base packages
```pacstrap /mnt base base-devel```    
update pacman key if necessary    
```pacman-key --refresh-keys```
## Config Fstab
```genfstab -L /mnt >> /mnt/etc/fstab```        
```cat /mnt/etc/fstab``` to check the partition is mount to right directory.
## Chroot
```arch-chroot /mnt```
## Time zone
```ln -sf /usr/share/zoneinfo/Region/City /etc/localtime```    
```hwclock --systohc```
## Install necessary package
```pacman -S git neovim dialog wpa_supplicant```
## Localization
Uncomment en_US.UTF-8 UTF-8 and other needed locales in /etc/locale.gen    
```nvim /etc/locale.gen```    
run ```locale-gen``` to config    
Set the LANG variable in locale.conf, usually is "LANG=en_US.UTF-8"    
```/etc/locale.conf```
## Create the hostname file
```nvim /etc/hostname```
## Add matching entries to hosts
```nvim /etc/hosts```    
```
127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
```    
## Root password
```passwd```
## Intel-ucode
If the CPU is not Intel, this step can skip.
```pacman -S intel-ucode```
## Install Bootloader
Here only instruct systemd-boot.    
### Install
```bootctl --path=/boot install```    
### Config loader
```nvim boot/loader/loader.conf``` input as follow
```
default  arch
timeout  4
```
### Add loaders
```nvim boot/loader/entries/arch.conf``` input as follow
```
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options root=PARTUUID=my_partuuid_of_root_directory rw
```
my partuuid of root directory can use command "blkid" to get.
## Set up netctl
Install wpa_actiond     
```pacman -S wpa_actiond ```    
For wireless settings, use ```sudo wifi-menu -o``` as root to generate the profile file in /etc/netctl/.
Install the wpa_actiond package and start/enable netctl-auto@interface.service systemd unit. netctl profiles will be started/stopped automatically as you move from the range of one network into the range of another network (roaming).    
```systemctl enable netctl-auto@my_interface.service```    
Use command ```ip addr``` to get my_interface, my_interface is the name of the network card.

## create user and add user to group
Add new user
```useradd -m new_user```    
Give passwd to new user    
```passwd new_user```    
Add users to a group with the gpasswd command    
```gpasswd -a user group```    
Give the user permission to run all commands    
add "USER ALL=(ALL) NOPASSWD: ALL" to /etc/sudoers

## install yay
```pacman -S yay```

## install bluez and bluez-utils
```pacman -S bluez bluez-utils```    
Enable bluetooth.service for start with boot.    
```systemctl enable bluetooth.service```   
Start the ```bluetoothctl``` interactive command
Enter ```power on``` to turn the power to the controller on. It is off by default and will turn off again each reboot, add the line ```AutoEnable=true``` in ```/etc/bluetooth/main.conf``` at the bottom in the [Policy] section.
```nvim /etc/bluetooth/main.conf```    
```
[Policy]
AutoEnable=true
```
Enter ```devices``` to get the MAC Address of the device with which to pair.
Enter device discovery mode with ```scan on``` command if device is not yet on the list.
Turn the agent on with ```agent on``` or choose a specific agent: if you press tab twice after ```agent``` you should see a list of available agents, e.g. DisplayOnly KeyboardDisplay NoInputNoOutput DisplayYesNo KeyboardOnly off on.
Enter ```pair MAC_address``` to do the pairing (tab completion works).
If using a device without a PIN, one may need to manually trust the device before it can reconnect successfully. Enter ```trust MAC_address``` to do so.
Enter ```connect MAC_address``` to establish a connection.

# install xorg-xrdb
```yay xorg-xrdb```    
```cp .Xresources ~/``` 

# install 2bwm
install xcb-util-keysyms    
```yay xcb-util-keysyms```    
git clone this reportisy, go to 2bwm directory    
```make clean; make; sudo make install```            

# install alacritty
 1. install and configure the stable toolchain    
```rustup install stable```      
```rustup default stable```     
2. install alacritty    
```yay alacritty-git```         
```cp -r .config/alacritty ~/.config/```   

# install chromium
```yay chromium```   

# install xorg-xrandr
```pacman -S xorg-xrandr```    

# install arandr
```yay arandr```

# install xorg-server 
```yay xorg-server```

# install xorg-xinit
```yay xorg-xinit```    
```cp .xinitrc ~/```    
startx test above install is work, then    
```cp .zprofile ~/```        
pkill x to kill 2bwm

# install zsh powerline and nerd-fonts-complete
install zsh
```
yay zsh
yay zsh-completions
```    
To list all installed shells     
```chsh -l```    
And to set one as default for your user    
```chsh -s full-path-to-shell```    
install zsh-syntax-highlighting    
```yay zsh-syntax-highlighting```   
install Powerline
```
yay powerline
yay powerline-fonts
```     
install powerlevel9k and fonts     
```yay zsh-theme-powerlevel9k```    
```
git clone https://github.com/powerline/fonts.git
./install.sh
(need to test really need it or not)    
````
```cp .zshrc ~/```  

# install neovim
neovim should install after powerline        
```yay	neovim```       
```cp -r .config/nvim ~/.config/```  
Install the Vim-plug Plugin Manager    
``` curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim```   
nvim    
:PlugInstall    

# install rofi
yay rofi

# install pulseaudio pavucontrol imagemagick
```yay pulseaudio```    
```yay pavucontrol```     
use pavucontrol setup the sound       
```yay imagemagick```   
```sudo cp .script/pavol /usr/local/bin/```    
```sudo cp .script/screenshot /usr/local/bin/```    
```sudo chmod 755 /usr/local/bin/pavol```    
```sudo chmod 755 /usr/local/bin/screenshot```    
```mkdir ~/Pictures```

# install nitrogen
yay nitrogen

# install polybar
yay polybar     
```cp -r .config/polybar ~/.config/```     
use xrandr check screen info and change it in ~/.config/polybar/config and also change polybar config in ~/.xinitrc

# install sogou
```yay adobe-source-han-sans-cn-fonts```    
```yay fcitx```    
```yay fcitx-configtool```    
```yay fcitx-sogoupinyin```         
install can select qtwebkit-bin to reduce install time, but must install the following package at first.    
```fcitx-configtool```    
```fcitx-gtk2```    
```fcitx-gtk3```    
```fcitx-libpinyin```    
```fcitx-qt4```    
```fcitx-qt5```    
use fcitx-configtool to add chinese (chick off "only show current language" )



