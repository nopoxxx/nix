# NixOS config by nopox

## Installation

### 1. Install NixOS

Follow official guide:
https://nixos.org/download/

### 2. Enable Git temporarily

Uncomment `git` in `/etc/nixos/configuration.nix`:

    environment.systemPackages = with pkgs; [
      git <--
    ];

### 3. Apply configuration

    ```bash
    sudo nixos-rebuild switch
    ```

### 4. Clone repository

    ```bash
    git clone https://github.com/nopoxxx/nix.git
    ```

### 5. Copy hardware config

    ```bash
    sudo cp /etc/nixos/hardware-configuration.nix ~/nix/
    ```

### 6. Fix permissions

    ```bash
    sudo chown -R $USER:users /home/$USER/nix/nixos
    ```

### 7. Build system with flake

    ```bash
    sudo nixos-rebuild build --flake ~/nix#nixos
    ```

## ✅ Done
