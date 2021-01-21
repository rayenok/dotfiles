SHELL := /bin/bash
set -e
set -u

install_fira_code:
	sudo apt install fonts-firacode
install_oh_my_zsh:
	@echo "Installing oh my zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	@echo "Installing jovial theme"
	echo "$(curl -fsSL https://raw.githubusercontent.com/zthxxx/jovial/master/jovial.zsh-theme)" > ~/.oh-my-zsh/themes/jovial.zsh-theme
get-emacs:
	wget https://ftp.gnu.org/gnu/emacs/emacs-27.1.tar.xz
	sudo tar xvf emacs-27.1 /opt/
	sudo chown $(USER):$(USER) /opt/emacs-27.1
install-emacs:
	sudo apt update
	sudo apt install  autoconf automake build-essential ca-certificates clang cscope \
										curl eog exuberant-ctags g++ git global gnutls-de gpg graphviz \
										libc6-dev libdbus-1-dev libgif-dev libgnutls28-dev libgtk-3-dev \
										libgtk2.0-dev libice-dev libjpeg-dev libm17n-dev libmagickwand-dev \
										libncurses-dev libncurses5-dev libotf-dev libpng-dev libpng-dev \
										libpoppler-dev libpoppler-glib-dev libpoppler-private-dev librsvg2-dev \
										libsm-dev libtiff-dev libtiff5-dev libtool libx11-dev libxext-dev \
										libxi-dev libxml2-dev libxmu-dev libxmuu-dev libxpm-dev libxrandr-dev \
										libxt-dev libxtst-dev libxv-dev libz-dev locales make openssh-client \
										perl pkg-config plantuml python-pygments python2.7 python3 sqlite3 \
										sqlitebrowser texinf wget xaw3dg-dev xorg-dev zip zlib1g-dev \
										build-essential texinfo libx11-dev libxpm-dev libjpeg-dev \
										libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev \
										libxpm-dev automake autoconf libghc-gnutls-dev libtool-bin autoconf \
										texinfo libjpeg-dev libncurses5-dev libtiff5-dev libgif-dev libpng-dev \
										libxpm-dev libgtk-3-dev libgnutls28-dev libjansson-dev ripgrep cmake libvterm-dev \
										libtool-bin python3-pip
	sudo pip install cmake --upgrade
	cd /opt/emacs-27.1/; ./autogen.sh && ./configure && ./make && sudo make install
