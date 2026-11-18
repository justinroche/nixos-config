## Safety

Do not run `nixos-rebuild`, `git commit`, `git push`, or destructive or system-altering commands without explicit confirmation.

## Workflow

- This configuration applies Home Manager through NixOS. Do not use `home-manager switch`.
- Format Nix with `alejandra .` and validate with `nix flake check`.
- Use `nix flake update <input>` for deliberate input updates and review the resulting lock-file diff.
- Git flakes only include new files once they are staged.

## Constraints

- `hardware-configuration.nix` is generated. Edit it only for a confirmed filesystem or UUID repair.
- Preserve the split boot layout: `/boot` is ext4 and `/boot/efi` is the shared Windows ESP. Keep kernels, initrd, GRUB, and Plymouth assets on `/boot`.
- Import only `nixos-hardware.nixosModules.dell-xps-15-9500-nvidia`; do not add the base XPS module as well.
- Keep the README current when changing repository structure or durable design constraints.
