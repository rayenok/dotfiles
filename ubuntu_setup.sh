#!/usr/bin/env bash

# Install packages
apt-get update
apt-get install -y \
    global \
    clang \
    curl \
    exuberant-ctags \
    cscope \
    git \
    libpoppler-glib-dev
    gnupg2 \
    java-common \
    default-jre \
    graphviz \
    gnutls-bin \
    guake \
    ranger \
    tmux \
    zsh \
    vim \
    autotools-dev \
    speedcrunch \
    automake \
    && rm -rf /var/lib/apt/lists/*

# Install guest-additions
# cd /tmp/
# wget -q -c http://download.virtualbox.org/virtualbox/5.2.6/VBoxGuestAdditions_5.2.6.iso
# sudo mkdir /media/VBoxGuestAdditions
# sudo mount -o loop,ro /tmp/VBoxGuestAdditions_5.2.6.iso /media/VBoxGuestAdditions
# sudo sh /media/VBoxGuestAdditions/VBoxLinuxAdditions.run 
# rm VBoxGuestAdditions_5.2.6.iso
# sudo umount /media/VBoxGuestAdditions
# sudo rm -rf /media/VBoxGuestAdditions
    
# get dotfiles
sudo git clone https://github.com/rayenok/dotfiles.git /opt/dotfiles
sudo chown -R r13:r13 /opt/dotfiles

# zsh
cp -r /opt/dotfiles/.oh-my-zsh ~/
cp -r /opt/dotfiles/.zshrc ~/
echo "zsh" >> ~/.bashrc

# Install emacs26
cd /tmp/
wget http://ftp.rediris.es/mirror/GNU/emacs/emacs-26.1.tar.gz
sudo tar xvf emacs-26.1.tar.gz -C /opt
cd /opt/emacs-26.1/
sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
sudo apt-get update
sudo apt-get build-dep -y emacs25
sudo ./configure
sudo make
sudo make install 
sudo chown -R $USER:$USER /opt/emacs-25.1

# get spacemacs from my repo
sudo git clone https://github.com/rayenok/spacemacs.git /opt/spacemacs
sudo chown -R r13:r13 /opt/spacemacs
ln -s /opt/spacemacs/ ~/.spacemacs

#FIXME: Next line has to be updated
ln -s /opt/spacemacs/docker/src/.org-capture-templates.el /home/$USER/.org-capture-templates.el

#Install monaco font
mkdir ~/.fonts
wget https://github.com/hbin/top-programming-fonts/raw/master/Monaco-Linux.ttf
mv Monaco-Linux.ttf ~/.fonts/
sudo fc-cache -fv

#Veracrypt
cd /tmp/
https://launchpad.net/veracrypt/trunk/1.23/+download/veracrypt-1.23-setup.tar.bz2

# bind org from dropbox
sudo mkdir /mnt/org/
sudo mount --bind /mnt/dropbox/org /mnt/org

# Pandoc
cd /tmp/
wget https://github.com/jgm/pandoc/releases/download/2.7.1/pandoc-2.7.1-1-amd64.deb
sudo dpkg -i pandoc-2.7.1-1-amd64.deb

# # Radare2
# cd /tmp/
# git clone https://github.com/radare/radare2.git
# mv radare2 /opt/
# cd /opt/
# sudo chown -R $USER:$USER radare2
# ./configure
# sudo make
# sudo make install 

# nmap
sudo apt-get install nmap
sudo apt-get install proxychains
# sandmap
sudo git clone https://github.com/trimstray/sandmap.git /opt/sandmap/ 
sudo chown -R $USER:$USER /opt/sandmap
cd /opt/sandmap/
./setup.sh install

# radamsa
cd /opt/
sudo wget https://gitlab.com/akihe/radamsa/-/archive/develop/radamsa-develop.tar.gz
sudo tar xvf radamsa-develop.tar.gz
rm radamsa-develop.tar.gz
sudo chown -R $USER:$USER radamsa-develop
cd /opt/radamsa-develop
make
sudo make install


#gef 
wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
sudo pip3 install ropper

# # Botch
# cd /opt/
# sudo wget https://sourceforge.net/projects/bochs/files/bochs/2.6.9/bochs-2.6.9.tar.gz/download
# sudo mv download bochs.tar.gz
# sudo tar xvf bochs.tar.gz
# sudo rm -rf bochs.tar.gz
# sudo chown -R $USER:$USER bochs-2.6.9
# cd /opt/bochs-2.6.9
# sudo ./configure
# sudo make
# sudo make install 

# z3
cd /opt/
sudo git clone https://github.com/Z3Prover/z3.git
sudo chown -R $USER:$USER /opt/z3
cd z3
./configure
python scripts/mk_make.py --prefix=/home/r13 --python --pypkgdir=/home/r13/.local/lib/python2.7/site-packages/ 
cd build;make 
sudo make install
#sudo pip2 install z3
#sudo pip install z3

# # install beyond compare
# sudo apt-get install libqtwebkit4 libqt4-opengl
# cd /tmp/
# wget https://www.scootersoftware.com/bcompare-4.2.9.23626_amd64.deb
# sudo dpkg -i bcompare-4.2.9.23626_amd64.deb

# ghidra
cd /tmp
wget https://ghidra-sre.org/ghidra_9.0_PUBLIC_20190228.zip
unzip ghidra_9.0_PUBLIC_20190228.zip
sudo mv ghidra_9.0 /opt/
sudo chown -R $USER:$USER ghidra_9.0
sudo apt-get install openjdk-11-jdk

# docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update 
sudo apt install docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}

# pip
sudo apt-get install python-pip
sudo apt-get install python3-pip

# python libraries
sudo apt-get install libssl-dev
sudo pip install lief requests capstone keystone unicorn scapy scrapy numpy scipy matplotlib ipython
sudo pip3 install lief requests capstone keystone unicorn scapy scrapy numpy scipy matplotlib ipython

# #spin (model checker)
# sudo git clone https://github.com/nimble-code/Spin.git /opt/spin/
# sudo chown -R $USER:$USER /opt/spin
# cd /opt/spin
# sudo apt-get install bison
# make
# cd Src
# sudo ln -s $PWD/spin /usr/bin/spin
# sudo apt-get install tk8.5
# sudo ln -s /usr/bin/wish8.5 /usr/bin/wish 
# sudo ln -s /opt/spin/optional_gui/ispin.tcl /usr/bin/ispin 

# #Mars (MIPS)
# cd /opt/
# sudo wget http://courses.missouristate.edu/kenvollmar/mars/MARS_4_5_Aug2014/Mars4_5.jar
# sudo chown -R $USER:$USER Mars4_5.jar
# sudo chmod +x Mars4_5.jar

# cppchecker
cd /opt/
sudo git clone https://github.com/danmar/cppcheck.git /opt/cppcheck
sudo chown -R $USER:$USER cppcheck
cd cppcheck
make 
sudo make install

# https://dwheeler.com/flawfinder/
pip install flawfinder


# splint
sudo apt-get install splint

# eclipse
cd /tmp/
wget https://www.eclipse.org/go/PROMO_ECLIPSEIDE_FOOTER?utm_source=eclipse_foundation&utm_medium=featured_footer&utm_campaign=eclipse_ide_2019_03
sudo tar xvf eclipse-cpp-2019-03-R-linux-gtk-x86_64.tar.gz -C /opt/
sudo chown -R $USER:$USER /opt/eclipse
sudo ln -s /opt/eclipse/eclipse /usr/bin/eclipse

# Install manually
# Qemu
sudo apt-get install qemu-kvm qemu virt-manager virt-viewer

# # Pycharm
# cd /tmp/
# wget https://download.jetbrains.com/python/pycharm-community-2019.1.tar.gz
# sudo tar xvf pycharm-community-2019.1.tar.gz -C /opt
# sudo chown -R $USER:$USER /opt/pycharm-community-2019.1
# sudo ln -s /opt/pycharm-community-2019.1/bin/pycharm.sh /usr/bin/pycharm

# VMware
# Install manually

#Virtualbox
sudo apt-get install libqt5opengl5 libqt5printsupport5
# Install manually

# IDA free version
# Install manually

# # Kali <- ALERT: this steps break ubuntu for some reason
# sudo git clone https://github.com/LionSec/katoolin.git /opt/katoolin/
# sudo chown -R $USER:$USER /opt/katoolin
# cd /opt/katoolin
# sudo chmod +x katoolin.py
# sudo ./katoolin.py
# # Tools installed using katooling:
# # | - nmap 
# # | - enum4linux 
# # | - dotdotpwn
# # | - exploitdb 
# # | - amap 
# # | - sfuzz 
# # | - aircrack-ng 
# # | - kismet 
# # | - dirbuster 
# # | - mitmproxy 
# # | - sslstrip 
# # | - john-the-ripper 
# # | - hash-identifier
# # | - wordlists 

# THC-hydra
https://www.thc.org/thc-hydra/

# wireshark
sudo apt-get install wireshark

# afl
cd /tmp
git clone https://github.com/mcarpenter/afl.git
sudo mv afl /opt/ 
sudo chown -R $USER:$USER /opt/afl 
cd /opt/afl
make && sudo make install

# afl-triforce
docker pull moflow/afl-triforce

# zap
cd /tmp/
wget https://github.com/zaproxy/zaproxy/releases/download/2.7.0/ZAP_2_7_0_unix.sh
sudo chmod +x ZAP_2_7_0_unix.sh
sudo ./ZAP_2_7_0_unix.sh

# burpsuite
wget https://portswigger.net/burp/releases/download?product=community&version=1.7.36&type=linux
sudo chmod +x burpsuite_community_linux_v1_7_36.sh
sudo ./burpsuite_community_linux_v1_7_36.sh

# miasm
cd /opt/
sudo git clone https://github.com/cea-sec/miasm.git
sudo chown -R $USER:$USER miasm
cd miasm
pip install llvmlite
python setup.py build
sudo python setup.py install

# sqlmap
cd /opt/
sudo git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
sudo chown -R $USER:$USER sqlmap-dev 
sudo ln -s /opt/sqlmap-dev/sqlmap.py /usr/bin/sqlmap

# binwalk
sudo apt-get install binwalk

# scrot for screenshots
sudo apt-get install scrot

# synthesis
# john the ripper
# sage
# hashcat
# dotNetInspector
# dotpeek <- only works on windows
# dex2jar
# kali

# Configure language
#echo "es_ES.UTF-8 UTF-8" > /etc/locale.gen \
#    && locale-gen es_ES.UTF.8 \
#    && dpkg-reconfigure locales \
#    && /usr/sbin/update-locale LANG=es_ES.UTF-8

## Get plantuml
#mkdir -p /home/vagrant/.plantuml
#curl -s -L https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o .plantuml/plantuml.jar
#chown -R vagrant:vagrant /home/vagrant/.plantuml
#
## Install dotfiles
#cd
#rm -rf .emacs.d
#
#sudo -u vagrant ln -s /vagrant/src/.emacs.d/ /home/vagrant/
#sudo -u vagrant ln -s /vagrant/src/.spacemacs /home/vagrant/



#echo "----- END -----"
