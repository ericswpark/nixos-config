# NixOS-config

Holds my configuration files for my NixOS machines


# Installation

If installing on a new machine or restoring:

```
nix-shell -p git    # new system, git not available
git clone git@github.com:ericswpark/dot_files.git ~/.dotfiles   # if using my dotfiles
git clone git@github.com:ericswpark/nixos-config.git ~/nixos-config
sudo mv /etc/nixos /etc/nixos.bak
sudo ln -s ~/nixos-config/ /etc/nixos

# New machines have wrong hostname set, set manually
sudo nixos-rebuild switch --flake ~/nixos-config/#hostnamehere
```

## Post-installation steps

- Adjust any hardware-specific settings
- Generate SSH keys, add to GitHub
- Import GPG keys
- Consider setting up Korean input ([see below](#korean-input))
- Setup Tailscale

# Updates

```
nix flake update
sudo nixos-rebuild switch
```

# Setup

## Korean input

A few more setup steps are required for Korean input after installation:

- Under "System Settings > Keyboard > Virtual Keyboard", select "Fcitx 5" and click "Apply"
- Under "System Settings > Language & Time > Input Method", add the "Hangul" input method and ensure it is under "Input Method On". Also add the "Keyboard - Korean - Korean (101/104-key compatible)" layout if you want English input (under the Korean keyboard layout). At the end it should look like this:

![Plasma System Settings Input Method configuration ](images/korean-input-kde-plasma-system-settings-input-method.png)

- Click "Apply" to save changes and reboot (or log out and log back in)

## OneDrive mount

Used for Purdue

- `rclone config`
- `n` (new config)
- `onedrive` (storage type)
- Press Enter twice to leave `client_id` and `client_secret` empty
- `global` (region)
- Press Enter to leave `tenant` empty
- `n` for advanced config
- `y` to authenticate with browser
- Sign in with credentials
- `onedrive` for `config_type`
- `1` for `config_driveid` (there should only be one)
- `y` to confirm drive
- `y` to confirm remote
- `q` to quit
- `systemctl --user enable --now rclone-purdue-mount`


# Hosts

- `wendy` - ThinkPad T480
- `wendigo` - ThinkPad T480 clone test
