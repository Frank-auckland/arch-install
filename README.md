# install arch 
https://wiki.archlinux.org/index.php/installation_guide#Installation and https://www.viseator.com/2017/05/17/arch_install/ (don't install vim, install neovim)      
https://www.youtube.com/watch?v=NFi6HwtPBgA (recommended, specially systemd-boot part)     
https://wiki.archlinux.org/index.php/Systemd-boot      
create user and group https://wiki.archlinux.org/index.php/users_and_groups#Example_adding_a_user      
change mirror in /etc/pacman.d/mirrorlist to nearby mirror (move nearby mirror to top of the list).    
```locale-gen``` must run after uncomment en_US.UTF-8 UTF-8 and other needed locales in /etc/locale.gen    

# create user and add user to group
https://wiki.archlinux.org/index.php/users_and_groups#Example_adding_a_user    
add "USER ALL=(ALL) NOPASSWD: ALL" to /etc/sudoers

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
https://wiki.archlinux.org/index.php/zsh#Installation    
https://wiki.archlinux.org/index.php/Powerline  
To list all installed shells     
```chsh -l```    
And to set one as default for your user    
```chsh -s full-path-to-shell```    
install zsh-syntax-highlighting    
```yay zsh-syntax-highlighting```    
install powerlevel9k and fonts     
https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#step-1-install-powerlevel9k  

https://github.com/bhilburn/powerlevel9k    
```cp .zshrc ~/``` 

# install neovim
neovim should install after powerline    
https://wiki.archlinux.org/index.php/Neovim    
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
fcitx-configtool,fcitx-gtk2,fcitx-gtk3,fcitx-libpinyin,fcitx-qt4,fcitx-qt5. use fcitx-configtool to add chinese (chick off "only show current language" )



