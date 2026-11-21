## Workflow

- This configuration applies Home Manager through NixOS. Do not use `home-manager switch`.
- Format Nix with `alejandra .` and validate with `nix flake check`.
- Use `nix flake update <input>` for deliberate input updates and review the resulting lock-file diff.

## Constraints

- `hardware-configuration.nix` is generated; probably don’t edit.
- Preserve the split boot layout: `/boot` is ext4 and `/boot/efi` is the shared Windows ESP.
- Import only `nixos-hardware.nixosModules.dell-xps-15-9500-nvidia`, not the base XPS module.
- Keep the README current when changing repository structure or durable design constraints.

- Do not run `nixos-rebuild`, `git commit`, `git push`, or destructive or system-altering commands without confirmation.
