# NixOS configuration for XPS 15

Declarative NixOS and home manager configuration for a Dell XPS 15 9500

## Structure

- `flake.nix` - system definition.
- `configuration.nix` - NixOS services, boot, networking, user setup.
- `home.nix` - home manager packages.
- `plasma/` - Plasma desktop, panel, app settings.
- `nvim/`, `tmux/`, `zsh/` - editor and shell configuration.
- `secrets/` - sops-encrypted secrets.

## Usage

Format and validate:

```sh
alejandra .
nix flake check
```

Apply the config:

```sh
sudo nixos-rebuild switch --flake ~/nixos-xps#justin-xps
```

Update flake inputs:

```sh
nix flake update <input>
```

## Design notes

- Where possible, substantial config text belongs in a dedicated directory, not inline.
- Secrets are managed with SOPS and an age key kept outside the repo.
- `/boot` is the ext4 boot partition.
- `/boot/efi` is my shared Windows ESP. GRUB, Plymouth, boot stuff stays on `/boot`.
