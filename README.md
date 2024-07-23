# Dotfiles

Este repositório contém meus arquivos de configuração pessoal (dotfiles) para personalizar e otimizar meu ambiente de desenvolvimento.

## Índice

- [Instalação](#instalação)
- [Ferramentas e Tecnologias](#ferramentas-e-tecnologias)
- [Configurações Incluídas](#configurações-incluídas)
- [Estrutura do Repositório](#estrutura-do-repositório)

## Instalação

Para clonar e instalar os dotfiles no seu sistema, execute os seguintes comandos:

```bash
git clone https://github.com/hsolrac/dotfiles.git
cd dotfiles
./install.sh
```

O script `install.sh` fará backup de qualquer arquivo de configuração existente e criará links simbólicos para os novos dotfiles.

## Ferramentas e Tecnologias

- **i3wm**: Gerenciador de janelas tiling
- **Kitty**: Emulador de terminal
- **Neovim**: Editor de texto
- **nvim-cmp**: Plugin de autocompletar para Neovim
- **Tmux**: Gerenciador multplex para sessões no terminal
- **Manjaro** ou **Ubuntu**: Distribuição Linux

## Configurações Incluídas

- **i3wm**: Configurações de layout, atalhos de teclado e aparência.
- **Kitty**: Configurações de tema, fontes e atalhos.
- **Neovim**: Plugins, mapeamentos e configurações gerais.
- **Fish**: Alias, funções e prompt personalizados.
- **Tmux**: keybinds, temas e plugin cpu.

## Estrutura do Repositório

```plaintext
dotfiles/
├── aliases/
│   └── aliases
├── config/
│   └── fish/
│   └── i3/
│       └── config
│   └── kitty/
│       └── kitty.conf
│   └── neovim/
│       ├── after/
│       ├── ch/
│       ├── init.lua
│       ├── lazy-lock.json
│       ├── nvim-vimscript/
│       ├── pack/
│       ├── plugin/
│       └── README.md
├── tmux/
│   └── .tmux.conf
├── wallpapers/
└── install.sh
```
