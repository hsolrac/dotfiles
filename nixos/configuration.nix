{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.extraHosts = ''
    127.0.0.1 local.locavibe.com.br
  '';

  fonts.packages = with pkgs; [ 
    nerd-fonts.fira-code
    fira-code-symbols
    font-awesome
    # nerdfonts
  ];

  nix = {
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  fonts.fontconfig.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  environment.pathsToLink = [ "/libexec" ]; 

  services.xserver = {
    enable = true;
  
    desktopManager = {
      xterm.enable = false;
    };
  
    displayManager = {
      lightdm.enable = true;
    };
  
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
        i3blocks
        rofi
        polybar
      ];
    };
  };

  services.displayManager.defaultSession = "none+i3";

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.xserver.screenSection = ''
    Option "PreferredMode" "1920x1080"
  '';

  services.xserver.xkb = {
    layout = "br";
    variant = "thinkpad";
  };

  console.keyMap = "br-abnt2";

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    settings = {
      blur = {
        method = "kernel";
        strength = 6;
      };
    };
  };

  users.users.carlos = {
    isNormalUser = true;
    description = "carlos";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    ];
    shell = pkgs.fish;
  };
  
  virtualisation.docker.enable = true;
  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config = {
   packageOverrides = pkgs: let
      pkgs' = import <nixpkgs-unstable> {
        inherit (pkgs) system;
        overlays = [
          (import (builtins.fetchTarball {
            url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
          }))
        ];
      };
    in {
      inherit (pkgs') neovim;
    };
  };
   nixpkgs.config.permittedInsecurePackages = [
     "python-2.7.18.8"
   ];

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git 
    unzip 
    gzip 
    tmux
    gcc
    google-chrome 
    fish
    yarn
    nodejs
    docker
    jq
    ripgrep
    fzf
    kitty
    discord
    direnv
    nix-direnv
    postman
    libreoffice
    maim
    flameshot
    mongodb-compass
    xclip
    feh
    tmuxinator
    usql
    picom
    pavucontrol
  ];

  programs.fish.enable = true;
  system.stateVersion = "25.05";
}
