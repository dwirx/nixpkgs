##################################################################
#                       Development shells
##################################################################

{ pkgs, ... }: {
  default = pkgs.mkShell {
    name = "devshell";
    description = "Development shell";
    buildInputs = [ ];
  };
  bun = pkgs.mkShell {
    buildInputs = [ pkgs.bun ];
  };
  python = pkgs.mkShell {
    buildInputs = [ pkgs.python3 ];
  };
  go = pkgs.mkShell {
    buildInputs = [ pkgs.go ];
  };
}
