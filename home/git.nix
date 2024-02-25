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

      ac = "!git add . && git commit -m \"$1\" && :";
      acp = "!git add . && git commit -m \"$1\" && git push";
      acnc = "git add . && git commit --allow-empty-message -m \"\"";

      # list commits in short form, with colors and branch/tag annotations
      hist = "log --pretty=format:'%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cgreen\\ [%cn]' --decorate --date=short";
      hsit = "!git hist";

      # pass in the name or email address of someone involved with the project
      whois = "!sh -c 'git log -i -1 --pretty=\"format:%an <%ae>\n\" --author=\"$1\"' -";

      # List Aliases
      al = "!git config -l | grep alias | cut -c 7-";


    };
  };
  programs.gh = {
    enable = true;
  };
}
