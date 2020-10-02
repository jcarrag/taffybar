{
  description = "A flake for building Taffybar";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/2eeaa0ae55960832510643bc10f88f5d961c3b6a";

  outputs = { self, nixpkgs }:
    let
      overlays = [ (import ./overlay.nix) ];
      pkgs = import nixpkgs { system = "x86_64-linux"; inherit overlays; };
    in
      {
        defaultPackage.x86_64-linux = pkgs.haskellPackages.taffybar;

        devShell = pkgs.haskellPackages.shellFor { packages = p: [ p.taffybar ]; };
      };
}
