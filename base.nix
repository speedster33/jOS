{ config, lib, pkgs, ... }:
{
  imports =
    [
      <home-manager/nixos>
      ./hardware-configuration.nix
      ./fish.nix
      ./neovim.nix
    ];

    boot.loader.grub = {
      device = "/dev/sda";
      enable = true;
      configurationLimit = 37;
    };

    networking.hostName = "malleum"; # Define your hostname.
    networking.networkmanager.enable = true;

    time.timeZone = "America/New_York";

    i18n.defaultLocale = "en_US.utf8";

    users.users.joshammer = {
      isNormalUser = true;
      description = "Josh Hammer";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = lib.mkOverride 500 pkgs.fish;
    };

    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = true;
    };

    home-manager.users.joshammer = { pkgs, ... }: {
      home = {
        username = "joshammer";
        homeDirectory = "/home/joshammer";
        stateVersion = "22.05";
        packages = with pkgs; [];
      };

      programs.kitty = {
        enable = true;
        settings = {
          enable_audio_bell = false;
          background_opacity = ".2";
          confirm_os_window_close = "0";

        };
      };

      programs.git = {
        enable = true;
        userName = "Malleus Tempus";
        userEmail = "jph33@outlook.com";
        aliases = {
          kill = "!sh -c 'git reset HEAD --hard && git clean -xdf'";
        };
      };
    };


    console = {
      font = "Calibri";
      keyMap = "dvorak";
    };

    services.xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "dvorak";
      xkbOptions = "caps:escape";

      libinput = {
        enable = true;
        touchpad.naturalScrolling = true;
      };

      displayManager.sddm.enable = true;
      displayManager.defaultSession = "none+i3";
      windowManager.i3 = {
        enable = true;
        configFile = ./i3.config;
      };
    };

    services.printing.enable = true;

    sound.enable = true;
    hardware.pulseaudio.enable = true;

    nixpkgs.config.allowUnfree = true;

    environment.variables = {
      EDITOR = "vi";
      VISUAL = "vi";
    };

  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neofetch
    wget
    gh
    brave
    qutebrowser
    python3
    jdk
    rofi
  ];

  environment.shellAliases = {
    snrs = "sudo nixos-rebuild switch";

    con = "nvim /home/joshammer/.config/nixos/";
    con-nvim = "nvim /home/joshammer/.config/nixos/neovim.nix";
    con-fish = "nvim /home/joshammer/.config/nixos/fish.nix";
    con-base = "nvim /home/joshammer/.config/nixos/base.nix";
  };

  programs.htop = {
    enable = true;
    settings.tree_view = true;
  };

  services.openssh.enable = true;

  system = {
    stateVersion = "22.05";
    autoUpgrade = {
      enable = true;
    };
  };
}
