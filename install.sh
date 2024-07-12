#!/bin/bash
install_packages_and_programms() {
  #cli bitwarden 
  npm install -g @bitwarden/cli
  
  #kitty
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
  cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/

  #neovim
  git clone git@github.com:neovim/neovim.git

  make CMAKE_BUILD_TYPE=RelWithDebInfo
  sudo make install
}

install_asdf_packages() {
    asdf plugin add ruby 
    asdf plugin add nodejs 
    asdf plugin add yarn
    asdf plugin add rust 
    asdf plugin add redis
    asdf plugin add tmux

    asdf install ruby latest
    asdf install nodejs latest
    asdf install yarn latest
    asdf install rust latest
    asdf install redis latest
    asdf install tmux latest

    asdf global ruby latest
    asdf global nodejs latest
    asdf global yarn latest
    asdf global rust latest
    asdf global redis latest
    asdf global tmux latest
}

copy_dotfiles() {
    mkdir -p ~/.config/nvim
    cp -r ~/repos/dotfiles/config/nvim/* ~/.config/nvim/

    cp -r ~/repos/dotfiles/config/i3 ~/.config/
    cp -r ~/repos/dotfiles/config/fish ~/.config/
}

setup_manjaro() {
    echo "Configurando para Manjaro..."

    sudo pacman -Syu --noconfirm

    sudo pacman -S --noconfirm base-devel git curl wget i3 i3status

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
    echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
    source ~/.bashrc

    install_asdf_packages

    mkdir -p ~/repos

    git clone https://github.com/hsolrac/dotfiles ~/repos/dotfiles

    copy_dotfiles

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

    sudo apt install -y build-essential git curl wget i3 i3status 

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
    echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
    source ~/.bashrc

    install_asdf_packages

    mkdir -p ~/repos

    git clone https://github.com/hsolrac/dotfiles ~/repos/dotfiles

    copy_dotfiles

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

