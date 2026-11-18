# NixOS configuration for XPS 15 9500

Declarative NixOS and Home Manager configuration for a Dell XPS 15 9500 with Intel/NVIDIA hybrid graphics, KDE Plasma, and a Windows dual boot.

## Structure

- `flake.nix` - flake inputs and the system definition.
- `configuration.nix` - NixOS services, boot, networking, and user setup.
- `home.nix` - Home Manager programs and user packages.
- `plasma/` - Plasma desktop, panel, KWin, and application settings.
- `nvim/`, `tmux/`, `zsh/` - editor and shell configuration loaded from dedicated files.
- `secrets/` - SOPS-encrypted secrets.
- `docs/cheatsheet.md` - personal tmux, Neovim, Yazi, and CLI reference.

## Usage

Format and validate changes:

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
- Secrets are managed with SOPS and an age key kept outside the repository.
- `/boot` is the ext4 boot partition. `/boot/efi` is the shared Windows ESP; kernels, initrd, GRUB, and Plymouth assets stay on `/boot`.
