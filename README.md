# NixOS-config

Holds my configuration files for my NixOS machines


# Installation


```
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

