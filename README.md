# install arch 
https://wiki.archlinux.org/index.php/installation_guide#Installation and https://www.viseator.com/2017/05/17/arch_install/ (don't install vim, install neovim)      
https://www.youtube.com/watch?v=NFi6HwtPBgA (recommended, specially systemd-boot part)     
https://wiki.archlinux.org/index.php/Systemd-boot      
create user and group https://wiki.archlinux.org/index.php/users_and_groups#Example_adding_a_user      
change mirror in /etc/pacman.d/mirrorlist to nearby mirror (move nearby mirror to top of the list).


# upgrade pacman keys
```pacman-key --refresh-keys``` 

# install dialog wpa_supplicant
pacman -S dialog wpa_supplicant

# install yay
https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/    
after this use yay -S yay install yay again, let yay under yay control

# install netctl and wpa_actiond
https://wiki.archlinux.org/index.php/netctl#Wireless, interface.service can find out form command ip addr (the card name).

# install bluez and bluez-utils
https://wiki.archlinux.org/index.php/bluetooth#Installation

# install xorg-xrandr
```pacman -S xorg-xrandr```    
```cp .zprofile ~/```····

# install xorg-xinit
```yay xorg-xinit```
```cp .xinitrc ~/``` 

# install xorg-server 
```yay xorg-server```    


# install 2bwm
install xcb-util-keysyms
```yay xcb-util-keysyms```
git clone this reportisy, go to 2bwm directory    
```make clean; make; sudo make install```        
copy .xinitrc .xprofile .Xresources to user home directory.      
```cp .xprofile ~/```    
```cp .Xresources ~/```   


# install rofi
yay rofi

# install chromium
```yay chromium```

# install zsh powerline and nerd-fonts-complete
https://wiki.archlinux.org/index.php/zsh#Installation    
https://wiki.archlinux.org/index.php/Powerline    
```yay nerd-fonts-complete```    
```cp .zshrc ~/``` 


# install neovim
neovim should install after powerline    
https://wiki.archlinux.org/index.php/Neovim    
```cp -r .config/nvim ~/.config/```    

# install alacritty
```yay alacritty-git```         
```cp -r .config/alacritty ~/.config/```    

# install pulseaudio pavucontrol imagemagick
yay pulseaudio    
yay pavucontrol    
yay imagemagick   
```cp .script/pavol /usr/local/bin/```    
```cp .script/screenshot /usr/local/bin/```    
```sudo chmod 755 /usr/local/bin/pavol```    
```sudo chmod 755 /usr/local/bin/screenshot```    
```mkdir ~/Pictures```

# install nitrogen
yay nitrogen

# install polybar
yay polybar     
```cp .config/polybar ~/.config/``` 

# install sogou
```yay adobe-source-han-sans-cn-fonts```    
```yay fcitx```    
```yay fcitx-configtool```    
```yay fcitx-sogoupinyin```     
use fcitx-configtool to add chinese (chick off "only show current language" )



