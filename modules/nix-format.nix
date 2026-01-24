{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellApplication {
      name = "nix-format";

      runtimeInputs = [
        pkgs.nixfmt-rfc-style
        pkgs.findutils
      ];

      text = ''
        target=''${1:-.}

        echo "Formatting .nix files..."

        find "$target" -type f -name "*.nix" -exec sh -c 'nixfmt "$1" && echo "Formatted: $1"' _ {} \;
      '';
    })
  ];
}
