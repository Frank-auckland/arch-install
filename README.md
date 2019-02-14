# 1.install arch 
https://wiki.archlinux.org/index.php/installation_guide#Installation and https://www.viseator.com/2017/05/17/arch_install/ (don't install vim, install neovim)

# 2.upgrade pacman keys
```pacman-key --refresh-keys``` 

# 3.install dialog wpa_supplicant
pacman -S dialog wpa_supplicant

# 4. install yay
https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/    
after this use yay -S yay install yay again, let yay under yay control

# 5. install netctl and wpa_actiond
https://wiki.archlinux.org/index.php/netctl#Wireless, interface.service can find out form command ip addr (the card name).

# 6. install bluez and bluez-utils
https://wiki.archlinux.org/index.php/bluetooth#Installation

# 7. install xorg-xrandr
pacman -S xorg-xrandr

# 8. install rofi
yay rofi

# 9. install 2bwm
git clone this reportisy, go to 2bwm directory, run ```make clean; make; sudo make install```    
copy .xinitrc .xprofile .Xresources to user home directory.

# 10. install zsh and powerline
https://wiki.archlinux.org/index.php/zsh#Installation    
https://wiki.archlinux.org/index.php/Powerline    
copy .zshrc to user home directory.

# 11. install neovim
neovim should install after powerline    
https://wiki.archlinux.org/index.php/Neovim    
copy .config/nvim to home directory    

# 12. install alacritty
yay alacritty-git    
copy .config/alacritty to home directory    

# 13. install pulseaudio pavucontrol imagemagick
yay pulseaudio    
yay pavucontrol    
yay imagemagick    






Pulse Audio, Archlinux Wiki it

Install pavucontrol
pkgfile import


