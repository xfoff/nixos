{
  description = "he tried for so long but the people were still retarded";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    nixvim.url = "github:nix-community/nixvim/nixos-24.11";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    hyprls.url = "github:hyprland-community/hyprls";
  };

  outputs = { nixpkgs, nixpkgs-unstable, self, ... } @inputs:
    let
      system = "x86_64-linux";
      user-inputs = { 
        mainHostname = "iusenixbtw";
        mainUsername = "xfof";
      };
    in
      {
      nixosConfigurations.${user-inputs.mainHostname} = nixpkgs.lib.nixosSystem {
        system = system;
        modules = [
          ./modules/default.nix
        ];
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          config.permittedInsecurePackages = [
            "dotnet-sdk-6.0.428"
            "dotnet-runtime-7.0.20"
          ];
          overlays = [
            (final: prev: {
              unstable = import nixpkgs-unstable {
                inherit system;
                config.allowUnfree = true;
                config.permittedInsecurePackages = [
                  "dotnet-runtime-7.0.20"
                ];
              };
            })
          ];
        };
        specialArgs = { inherit inputs system user-inputs; };
      };
    };
}
