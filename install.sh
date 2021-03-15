# copy files
echo copying files
cp -vr config/* ~/.config
cp -vr fonts/* ~/.fonts || cp -vr fonts ~/.fonts


# install dependencies
echo installing dependencies
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt-get update
sudo apt install -y libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev

# install i3
echo install i3
sudo apt-get install -y i3

# install i3gaps
echo installing i3gaps
#!/bin/bash
# created for installing i3-gaps over Linux Mint 18.1

# run with sudo

#-------------------------------------------------------------------------------

export DEBIAN_FRONTEND=noninteractive
apt-get update -q
apt-get upgrade -q -y

# depencies of i3-gaps
add-apt-repository ppa:aguignard/ppa -y
apt-get update -q
apt-get install -q -y	-o Dpkg::Options::="--force-confdef" \
						-o Dpkg::Options::="--force-confold" \
git automake libtool libxcb-xrm0 libxcb-xrm-dev

apt-get install -q -y   -o Dpkg::Options::="--force-confdef" \
                        -o Dpkg::Options::="--force-confold" \
libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev \
libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev \
libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev \
libxkbcommon-dev libxkbcommon-x11-dev autoconf


# install i3-gaps from source

# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
# compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
make install

# install misc. i3 packages
apt-get install -q -y	-o Dpkg::Options::="--force-confdef" \
						-o Dpkg::Options::="--force-confold" \
i3lock i3status dmenu dunst

# intall compton
echo installing compton
sudo apt-get install -y compton

# install polybar
echo installing polybar
sudo apt-get install -y polybar
