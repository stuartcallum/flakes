# flake.nix

{
  description = "Node.js and Next.js Flake";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;
  };

  outputs = { self, nixpkgs }: 
    let
      pkgs = nixpkgs.legacyPackages.${system} // nixpkgs.lib;

      nodejs = pkgs.nodejs_latest;
      nextjs = pkgs.nodePackages.next;

    in
    {
      defaultPackage = nextjs;

      packages = {
        nextjs = nextjs;
      };

      devShell = pkgs.mkShell {
        buildInputs = [ nodejs nextjs ];
      };
    };
}

