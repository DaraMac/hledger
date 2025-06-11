{
    description = "hledger development flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs, }:
    let
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in
    {
        devShells."x86_64-linux".default = with pkgs; mkShell {
            packages = with pkgs; [
                cabal-install
                ghc
                ghcid
                gnum4
                groff
                haskellPackages.hasktags
                haskellPackages.quickbench
                haskellPackages.shelltestrunner
                just
                pandoc
                stack
                watchexec
            ];
        };
    };
}
