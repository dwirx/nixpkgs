{ pkgs, ... }: {
  commandFoldl' = builtins.foldl' (a: b: a + b + '' &&'') '''';
  shellAliases = with pkgs;
    {
      tg = "tree --gitignore";
       #NIX Related
      nclean = commandFoldl' [
        "nix profile wipe-history"
        "nix-collect-garbage"
        "nix-collect-garbage -d"
        "nix-collect-garbage --delete-old"
        "nix store gc"
        "nix store optimise"
        "nix-stroe --verfy --repair --check-contents"
      ];
    };
  programs = {
    zoxide.enable = true;
    dircolors.enable = true;
    fish = {
      enable = true;
      # Fish Plugisn

      plugins = [

      ];

    };
  };
}
