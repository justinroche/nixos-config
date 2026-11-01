{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Boot
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    timeout = 15;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      gfxmodeEfi = "1920x1200";
      useOSProber = true;
      configurationLimit = 10;
    };
  };
  boot.plymouth.enable = true;
  boot.consoleLogLevel = 3;
  boot.initrd.verbose = false;
  boot.kernelParams = ["quiet" "rd.udev.log_level=3" "rd.systemd.show_status=auto"];

  catppuccin = {
    enable = true;
    autoEnable = true;
    cache.enable = true;
    grub.enable = true;
    grub.flavor = "mocha";
    plymouth.enable = true;
    plymouth.flavor = "mocha";
    sddm.enable = false;
  };

  # Nix
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["root" "justin"];
    trusted-public-keys = ["devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="];
  };

  sops = {
    defaultSopsFile = ./secrets/users.yaml;
    age.keyFile = "/home/justin/.config/sops/age/keys.txt";
    secrets.justin-password.neededForUsers = true;
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
    hashedPasswordFile = config.sops.secrets.justin-password.path;
    shell = pkgs.zsh;
  };

  # Programs
  programs.firefox.enable = true;
  programs.ssh.systemd-ssh-proxy.enable = false;
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  system.stateVersion = "26.05"; # never change
}
