{ inputs, outputs, lib, config, pkgs, ... }:

{
  # Home Manager imports
  imports = [
    # Your own modules
    # outputs.homeManagerModules.example
    # External modules (e.g., from nix-colors)
    # inputs.nix-colors.homeManagerModules.default
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;  # Allow unfree packages (if needed)
    };
  };

  home = {
    username = "fantasycrit";
    homeDirectory = "/home/fantasycrit";
    stateVersion = "25.05"; 

    # Install user-specific system packages
      packages = with pkgs; [
      neovim wget gruvbox-kvantum librewolf code-cursor vscodium git github-desktop
      nautilus code-nautilus bitwarden-desktop rofi gh wofi fish nerd-fonts.zed-mono
      alacritty ags cava sway hyprlock mpc rose-pine-cursor foot swww rose-pine-hyprcursor
      swaylock-effects mpd oh-my-posh gtk3 mako waybar dotnet-sdk nodejs nodePackages.npm
      python3 python3Packages.pip gcc clang kitty docker docker-compose htop btop neofetch
      unzip zip curl postman vlc gimp obs-studio spotify discord clickup gh
    ];
  };
}

