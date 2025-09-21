# your system. Help is available in the configuration.nix(5) man page, on

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  boot.loader.grub.efiSupport = true;  # UEFI suppor  boot.loader.grub.efiSupport = true;  # UEFI supportt	
  boot.loader.grub.device = "nodev";  # This should be the primary disk, usually /dev/sda

  # networking.hostName = "nixos"; # Define your hostname.
# Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
  services.xserver.displayManager.lightdm.enable=true;
  services.xserver.enable=true;
  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  nix.nixPath = [ "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos" ];
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
 
  # Configure console keymap
  console.keyMap = "fr";

  # Enable Hyprland
  programs.hyprland.enable = true;
  # Enable waybar
  programs.waybar.enable = true;
  
  
  # Configure keymap in X11
   services.xserver.xkb.layout = "fr";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define user account
  users.users.fantasycrit = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" "audio" "video" ];
    packages = with pkgs; [
      tree
    ];
    # Password will be set to "123" after rebuild
    initialPassword = "123";
  };
  
  # Configure sudo to not require password for wheel group
  security.sudo.wheelNeedsPassword = false;

  # programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    gruvbox-kvantum
    # Development tools and applications
    librewolf
    code-cursor
    vscodium
    git
    github-desktop
    nautilus
    code-nautilus
    bitwarden-desktop
    rofi
    wofi
    fish
    nerd-fonts.zed-mono
    alacritty
    ags
    cava
    sway
    hyprlock
    mpc
    rose-pine-cursor
    foot
    swww
    rose-pine-hyprcursor
    swaylock-effects
    mpd
    oh-my-posh
    gtk3
    mako
    waybar
    # Development environments
    xcursor-themes
    dotnet-sdk
    nodejs
    nodePackages.npm
    python3
    python3Packages.pip
    gcc
    clang
    kitty    
    # Docker
    docker
    docker-compose
    
    # System utilities
    htop          # Better process viewer
    btop          # Modern system monitor
    neofetch      # System info display
    unzip         # Archive extraction
    zip           # Archive creation
    curl          # HTTP client
    postman       # API testing (if you prefer GUI)
    
    # Media and graphics
    vlc           # Media player
    gimp          # Image editor
    obs-studio    # Screen recording/streaming
    spotify

    # Communication and productivity
    discord
    clickup
  ];
  fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable Docker
  virtualisation.docker.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}
