DOTFILES_DIR = $(HOME)/.dotfiles
PACKAGES = $(shell cat $(DOTFILES_DIR)/packages.txt)

yay:
	sudo pacman -S --needed git base-devel
	git clone https://aur.archlinux.org/yay.git
	cd yay && makepkg -si
	rm -rf yay

packages: install-yay
	yay -Syu --noconfirm
	yay -S $(PACKAGES) --noconfirm

copy-dotfiles:
	cp -r $(DOTFILES_DIR)/.config/kitty $(HOME)/.config/kitty || true
	cp -r $(DOTFILES_DIR)/.config/nvim $(HOME)/.config/nvim || true
	cp -r $(DOTFILES_DIR)/.config/i3 $(HOME)/.config/i3 || true

i3:
	yay -Syu i3 i3status i3block -y
	rm -rf ${HOME}/.config/i3
	ln -s $(realpath ./i3/) ${HOME}/.config/
	i3-msg reload || true;

nvim:
	git clone https://github.com/neovim/neovim.git ~/neovim
	cd ~/.neovim && make CMAKE_BUILD_TYPE=Release
	sudo make install
	rm -rf ${HOME}/.config/nvim
	ln -s $(realpath ./nvim/) ${HOME}/.config/nvim
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim -u ${HOME}/.config/nvim/init.vim +PlugInstall +qa

kitty:
	cd ~/.config/kitty && curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

asdf:
	git clone https://aur.archlinux.org/asdf-vm.git && cd asdf-vm && makepkg -si

nerd-fonts:
	mkdir -p ~/.local/share/fonts
	cd /tmp && curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
	unzip -o FiraCode.zip -d ~/.local/share/fonts
	fc-cache -fv

configure:
	@echo "  ____        _    __ _ _           "
	@echo " |  _ \  ___ | |_ / _(_) | ___  ___ "
	@echo " | | | |/ _ \| __| |_| | |/ _ \/ __|"
	@echo " | |_| | (_) | |_|  _| | |  __/\__ \\"
	@echo " |____/ \___/ \__|_| |_|_|\___||___/"

install: configure yay packages copy-dotfiles nvim kitty i3 asdf nerd-fonts
