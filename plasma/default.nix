{
  imports = [
    ./desktop.nix
    ./kwin.nix
    ./panel.nix
  ];

  programs.plasma = {
    enable = true;
  };
}
