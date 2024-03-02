{ config
, pkgs
, libs
, ...
}: {

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      arrterian.nix-env-selector
      golang.go
      rust-lang.rust-analyzer
      vadimcn.vscode-lldb
    ];
  };
}
