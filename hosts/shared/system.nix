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
  programs.nh = {
    enable = false;
  };

  time.timeZone = "Europe/Warsaw";
  system.stateVersion = "25.05";
  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandleLidSwitchExternalPower = "ignore";
    HandleLidSwitchDocked = "ignore";
    KillUserProcesses = true;
  };
}
