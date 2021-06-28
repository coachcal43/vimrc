# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, options, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  networking.timeServers = options.networking.timeServers.default ++ [ "time.google.com" ];

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    vim_configurable                    # vim with python
    iotop
    git					# Source Control
    emacs 				# Extra Text Editor
    alacritty 				# Default Terminal Emulator
    unzip 				# .zip file utility
    xclip				# COPY/PASTE utility
    arandr				# GUI for xrandr
    scrot 				# Screen Locker
    fish				# Default Shell
    vscode
    chromium
    slack
    ack
    file
    gnome3.nautilus 
    simplenote
    jetbrains.clion
    jetbrains.goland
    notepadqq
    screen
    usbutils
    tmux
    gnumake
    gcc
    glibc
    man
    zstd
    flameshot
    ghc
    stack
    cabal-install
    python
    python3
    gdb
    htop
    cudatoolkit
    python27Packages.setuptools
    python37Packages.pip
    python37Packages.pip-tools
    python37Packages.setuptools
    python37Packages.pycairo
    python37Packages.pygobject3
    linuxPackages.perf
    readline
    (steam.override { nativeOnly = true; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  services.chrony.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.pulseaudio.support32Bit = true;

  virtualisation.docker.enable = true;

  # Enable the X11 windowing system.
  # Settings for desktop, display, and window managers.
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [ dmenu
				   i3status
				   i3lock
				   i3blocks
 			         ];
    };
    videoDrivers = [ "nvidia" ];
  };

  # Enable fish as default shell
  programs.fish.enable = true;

  # User Account(s)
  users.users.calvin = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "docker" ]; # Enable ‘sudo’ for the user.
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

  # You'll be free hackers.
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.allowBroken = true;

  nixpkgs.config.require-sigs = false;
  # Anduril cache things...
  # Remove me if you're going to commit this to dotfiles repo.

}
