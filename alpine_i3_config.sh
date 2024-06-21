# Update and upgrade
apk update
apk upgrade

# HV Tools ans sshd config
wget https://raw.githubusercontent.com/qinnovate/alpinelinux/master/config.sh -O config.sh

# Main graphical config
setup-xorg-base
apk add xf86-video-fbdev xf86-video-vesa
apk add font-terminus
apk add dbus
dbus-uuidgen > /var/lib/dbus/machine-id
rc-update add dbus
apk add i3wm i3status xterm

adduser root
addgroup root input
addgroup root video
adduser blockso
addgroup blockso input
addgroup blockso video
#startx /usr/bin/i3

# Install extra packages
apk add ttf-dejavu dmenu perl feh picom xrandr
apk add alacritty vim zsh
apk add shadow
apk add git

# EXTRA TOOLS

# Setup folders
mkdir ~/.zsh
mkdir ~/.scripts
mkdir ~/.vim_runtime

# Install zsh packages
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh -O ~/.zsh/git.plugin.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/fast-syntax-highlighting

# Install z
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/.scripts/z.sh

# Install main vim plugins
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Move files and change shell
cp -R hv-alpine-i3/.config .
cp hv-alpine-i3/.zshrc .
chsh -s /bin/zsh