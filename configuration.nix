# Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

# Use Grub as bootloader
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      gfxmodeEfi = "1920x1080";
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
  virtualisation.virtualbox.guest.enable = true;

# Use the systemd-boot EFI boot loader.
# boot.loader.systemd-boot.enable = true;
# boot.loader.efi.canTouchEfiVariables = true;
# boot.initrd.checkJournalingFS = true;

# networking.hostName = "nixos";
# networking.networkmanager.enable = true;  

  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      dns = "default";
      wifi.backend = "iwd";
    };
    nameservers = [ "1.1.1.1" ];
    wireless = {
      enable = false;
      iwd.settings = {
	IPv6 = {Enabled = false; };
	Settings = { AutoConnect = true; };
      };
    };
      dhcpcd.enable = false;
      proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    };



# Set your time zone.
    time.timeZone = "Asia/Kolkata";
    i18n = {
      defaultLocale = "en_IN";
      extraLocaleSettings = {
	LC_ADDRESS = "en_IN";
	LC_IDENTIFICATION = "en_IN";
	LC_MEASUREMENT = "en_IN";
	LC_MONETRY = "en_IN";
	LC_NAME = "en_IN";
	LC_NUMERIC = "en_IN";
	LC_PAPER = "en_IN";
	LC_TELEPHONE = "en_IN";
	LC_TIME = "en_IN";
	LC_CTYPE = "en_US.UTF-8";
      };
    };

# Select internationalisation properties.
console = {
  earlySetup = true;
  font = "ter-powerline-v24b";
  packages = with pkgs; [ terminus_font powerline-fonts ];
  #keyMap = "us";
  useXkbConfig = true; # use xkb.options in tty.
};

# List services that you want to enable:
    services.dbus.enable = true;
    services.gvfs.enable = true;
# services.printing.enable = true;
    services.logind.lidSwitch = "suspend";
    services.xserver = {
      enable = true;

      desktopManager = {
	xterm.enable = true;
      };

      displayManager = {
	defaultSession = "none+i3";
	lightdm = {
	  enable = true;
	  greeters.gtk = {
	    enable = true;
	    theme.name = "catppuccin-mocha";
	  };
	};
      };

      windowManager.i3 = {
	enable = true;
	package = pkgs.i3-gaps;
	extraPackages = with pkgs; [
	    dmenu
	    picom
	    i3lock
	    i3status
	    i3blocks
	    rofi
	    feh
	    flameshot
	    wezterm
	];
      };
      layout = "in";
      xkbVariant = "eng";
    };

# Enable touchpad support (enabled default in most desktopManager).
# services.libinput.enable = true;
    services.locate = {
      enable = true;
      localuser = null;
      package = pkgs.mlocate;
    };


    hardware = {
      bluetooth.enable = false;
      bluetooth.powerOnBoot = false;
    };

    security.rtkit.enable = true;
    security.polkit.enable = true;
    security.pam.services.lightdm.enableGnomeKeyring = true;

    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
    };


    nix = {
      settings = {
	experimental-features = [ "nix-command" "flakes" ];
      };
    };

# Define a user account. Don't forget to set a password with â€˜passwdâ€™.
    users.users.jraj = {
      isNormalUser = true;
      home = "/home/jraj";
      extraGroups = [ "wheel" "networkmanager" "input" "kvm" "audio" "render" "video" ]; 
      packages = with pkgs; [
	tree
	  kitty
	  zig
	  ripgrep
	  fd
	  eza
	  fzf
	  dunst
	  chromium
	  alacritty
	  brightnessctl
	  android-tools
	  blueman
	  libnotify
	  pavucontrol
	  pipewire
	  obs-studio
	  obsidian
	  ];
    };

    fonts = {
      fonts = with pkgs; [
	fira-code
	  fira-code-symbols
	  liberation_ttf
	  noto-fonts
	  noto-fonts-emoji
	  roboto
	  iosevka
	  (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono"]; })
      ];
      enableDefaultPackages = true;
      fontconfig = {
	enable = true;
	defaultFonts = {
	  serif = [ "Times New Roman" ];
	  sansSerif = [ "Roboto" ];
	  monospace = [ "Fira Code" "JetBrainsMono"];
	};
      };
    };

    environment.systemPackages = with pkgs; [
      neovim
	vim
	htop
	xfce.thunar
	gvfs
	lxappearance
	unzip
	zip
	nwg-look
	jq
	git
	curl
	imv
	fastfetch
	feh
	acpi
	wget
	dbus
	xorg.xf86videovboxvideo
	lua
	python3
	python311Packages.pip
	python312Packages.pynvim
	cargo
	rustup
	nodejs_22
	luajit
	luajitPackages.luarocks
	go
	];

    nixpkgs.config.allowUnfree = true;

# programs.mtr.enable = true;
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };


# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
    networking.firewall.enable = false;

    system.copySystemConfiguration = true;

    system.stateVersion = "24.05"; # Did you read the comment?

  }

