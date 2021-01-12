install_fira_code:
	sudo apt install fonts-firacode
install_oh_my_zsh:
	@echo "Installing oh my zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	@echo "Installing jovial theme"
	echo "$(curl -fsSL https://raw.githubusercontent.com/zthxxx/jovial/master/jovial.zsh-theme)" > ~/.oh-my-zsh/themes/jovial.zsh-theme
