{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 1;

  # Nix
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.settings = {
    auto-optimise-store = true;
    trusted-users = ["root" "justin"];
    substituters = ["https://cachix.org"];
    trusted-public-keys = ["devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="];
  };

  # Network
  networking.hostName = "justin-xps";
  networking.networkmanager.enable = true;

  # Locale
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  # Desktop
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us";
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;

  nixpkgs.config.allowUnfree = true; # required for NVIDIA driver

  # Auth
  security.pam.services.sddm.enableKwallet = true;

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true; # required for PipeWire's realtime scheduling

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Users
  users.users.justin = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"]; # wheel = sudo access
    hashedPassword = "$6$FkRwt5YayAU6dVxB$J3XED4v/0gVsDZXyy36bUz.lTTHKo5Wh6LpItGvdz9gNBrPynAd3R4UgatFeR7z5TaBvCoL2lHjTCsXlAbezh/";
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  # Programs
  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    alejandra
    curl
    git
    vim
    vscode
    wget
  ];

  system.stateVersion = "26.05"; # never change
}
