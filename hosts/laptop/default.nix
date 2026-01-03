{ inputs, ... }:

{
  imports = [
    ../shared/bootloader.nix
    ../shared/network.nix
    ../shared/sound.nix
    ./packages.nix
    ../shared/users.nix
    ../shared/desktop.nix
    ./environment.nix
    ./graphics.nix
    ../shared/system.nix
    ../shared/keyboard.nix
    ../shared/nixvim/nixvim.nix
    ./hardware-configuration.nix
    inputs.nixvim.nixosModules.nixvim
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      xfof = import ./home.nix;
    };
    backupFileExtension = "backup";
  };
}
