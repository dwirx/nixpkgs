{ ... }: {
  programs.git = {
    enable = true;
    aliases = {
      g = "git";
      a = "add";
      cm = "commit -m";
      st = "status";
      br = "branch";

      # More commands in one
      aa = "!git add -A && git status";
      cma = "!git add -A && git commit -m";


      # Branches sorted by last modified
      # List Aliases
      al = "!git config -l | grep alias | cut -c 7-";
      acp = "!f() { git add . && git commit -m \"$1\" && git push; }; f";


    };
  };
  programs.gh = {
    enable = true;
  };
}
