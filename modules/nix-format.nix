{ pkgs, ... }:

let
  nixfmt = pkgs.nixfmt-rfc-style;

  # very silly script
  # WHY ESCAPE SEQ IN NIX IS "''" WHYYY???
  nixfmt-wrapper = pkgs.writeShellScriptBin "nix-format" ''
    #!/usr/bin/env bash
    set -euo pipefail

    NIXFMT="${nixfmt}/bin/nixfmt"

    GREEN='\033[0;32m'
    RED='\033[0;31m'
    NC='\033[0m'

    if ! command -v "$NIXFMT" >/dev/null 2>&1; then
      echo -e "''${RED}Error:''${NC} '$NIXFMT' is not installed or not in PATH."
      exit 1
    fi

    TARGET="''${1:-.}"

    if [ -f "$TARGET" ]; then
      # Format single file
      if [[ "$TARGET" == *.nix ]]; then
        echo -e "''${GREEN}Formatting:''${NC} $TARGET"
        "$NIXFMT" "$TARGET"
        echo -e "''${GREEN}File formatted successfully.''${NC}"
      else
        echo -e "''${RED}Error:''${NC} '$TARGET' is not a .nix file."
        exit 1
      fi
    elif [ -d "$TARGET" ]; then
      # Format directory
      echo -e "''${GREEN}Formatting .nix files in \"''${TARGET}\"...''${NC}"

      find "$TARGET" -type f -name "*.nix" -print0 | while IFS= read -r -d "" file; do
        echo -e "''${GREEN}Formatting:''${NC} $file"
        "$NIXFMT" "$file"
      done

      echo -e "''${GREEN}All .nix files formatted successfully.''${NC}"
    else
      echo -e "''${RED}Error:''${NC} '$TARGET' is not a file or directory."
      exit 1
    fi
  '';
in
{
  home.packages = [
    nixfmt-wrapper
  ];
}
