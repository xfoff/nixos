{
  description = "he tried for so long but the people were still retarded";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    nixvim.url = "github:nix-community/nixvim/nixos-24.11";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    hyprls.url = "github:hyprland-community/hyprls";
  };

  outputs = { nixpkgs, self, ... } @inputs:
    let
      system = "x86_64-linux";
      user-inputs = { 
        mainHostname = "iusenixbtw";
        mainUsername = "xfof";
      };
    in
    {
      nixosConfigurations = {
        "pc" = nixpkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./hosts/pc/default.nix
          ];
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            config.permittedInsecurePackages = [
              "dotnet-runtime-7.0.20"
              "dotnet-sdk-6.0.428"
            ];
          };
          specialArgs = { inherit inputs system user-inputs; };
        };

        "laptop" = nixpkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./hosts/laptop/default.nix
          ];
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            config.permittedInsecurePackages = [
              "dotnet-runtime-7.0.20"
              "dotnet-sdk-6.0.428"
            ];
          };
          specialArgs = { inherit inputs system user-inputs; };
        };
      };
    };
}
