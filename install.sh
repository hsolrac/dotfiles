#!/bin/bash

install_packages_and_programms() {
  npm install -g @bitwarden/cli
  
  #kitty
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
  cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
}

install_asdf_packages() {
    asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    asdf plugin add yarn
    asdf plugin add rust https://github.com/code-lever/asdf-rust.git
    asdf plugin add neovim https://github.com/richin13/asdf-neovim.git

    asdf install ruby latest
    asdf install nodejs latest
    asdf install yarn latest
    asdf install rust latest
    asdf install neovim latest

    asdf global ruby latest
    asdf global nodejs latest
    asdf global yarn latest
    asdf global rust latest
    asdf global neovim latest
}

move_dotfiles() {
    mkdir -p ~/.config/nvim
    mv ~/repos/dotfiles/nvim/* ~/.config/nvim/

    mv ~/repos/dotfiles/i3 ~/.config/
    mv ~/repos/dotfiles/fish ~/.config/
}

setup_manjaro() {
    echo "Configurando para Manjaro..."

    sudo pacman -Syu --noconfirm

    sudo pacman -S --noconfirm base-devel git curl wget

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
    echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
    source ~/.bashrc

    install_asdf_packages

    mkdir -p ~/repos

    git clone https://github.com/hsolrac/dotfiles ~/repos/dotfiles

    move_dotfiles

    sudo pacman -S --noconfirm fish

    chsh -s /usr/bin/fish

    git clone https://aur.archlinux.org/yay.git ~/repos/yay
    cd ~/repos/yay
    makepkg -si --noconfirm

    yay -Syu --noconfirm

    echo "Configuração para Manjaro concluída!"
}

setup_ubuntu() {
    echo "Configurando para Ubuntu..."

    sudo apt update && sudo apt upgrade -y

    sudo apt install -y build-essential git curl wget

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
    echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
    source ~/.bashrc

    install_asdf_packages

    mkdir -p ~/repos

    git clone https://github.com/hsolrac/dotfiles ~/repos/dotfiles

    move_dotfiles

    sudo apt install -y fish

    chsh -s /usr/bin/fish

    echo "Configuração para Ubuntu concluída!"
}

if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
        manjaro)
            setup_manjaro
            ;;
        ubuntu)
            setup_ubuntu
            ;;
        *)
            echo "Sistema operacional não suportado: $ID"
            exit 1
            ;;
    esac
else
    echo "Não foi possível detectar o sistema operacional."
    exit 1
fi

