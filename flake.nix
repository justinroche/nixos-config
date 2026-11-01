{
  description = "justin-xps NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    catppuccin.url = "github:catppuccin/nix";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixvim.url = "github:nix-community/nixvim/nixos-26.05";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    catppuccin,
    home-manager,
    plasma-manager,
    nixvim,
    sops-nix,
    ...
  }: {
    nixosConfigurations.justin-xps = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        nixos-hardware.nixosModules.dell-xps-15-9500-nvidia
        catppuccin.nixosModules.catppuccin
        sops-nix.nixosModules.sops

        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = {
            pkgsUnstable = import nixpkgs-unstable {
              system = "x86_64-linux";
            };
          };
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.justin = {
            imports = [
              nixvim.homeModules.nixvim
              plasma-manager.homeModules.plasma-manager
              ./home.nix
            ];
          };
        }
      ];
    };
  };
}
