# NixOS-config

Holds my configuration files for my NixOS machines


# Installation

If installing on a new machine or restoring:

```
nix-shell -p git    # new system, git not available
git clone git@github.com:ericswpark/nixos-config.git ~/nixos-config
sudo mv /etc/nixos /etc/nixos.bak
sudo ln -s ~/nixos-config/ /etc/nixos
```

# Updates

```
nix flake update
sudo nixos-rebuild switch
```

# Hosts

- `wendy` - ThinkPad T480
- `wendigo` - ThinkPad T480 clone test
