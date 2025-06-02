{ self, pkgs, lib, inputs, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  programs.nix-ld.enable = true;
  time.timeZone = "Europe/Warsaw";
  system.stateVersion = "25.05";
}
