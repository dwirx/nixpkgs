{ pkgs, ... }: {
  home.username = "hades";
  home.homeDirectory = "/home/hades";
  home.stateVersion = "22.11"; # To figure this out you can comment out the line and see what version it expected.
  programs.neovim.enable = true;
  home.packages = with pkgs; [
    bat
    vim
    btop
    gdu
    nodejs

    #files
    ranger
    fzf
    trash-cli

    # zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    # eza
    neofetch
    unzip
    fzf-zsh
    # tmux

   ##
    direnv
    nix-direnv
  # New
    

  ];
  #eza
  programs.eza = {
      enable = true;
      enableAliases = true;
    };
  # FISH
  programs.fish = {
      enable = true;
      # shellAbbrs = {
      shellAliases = {
        cp = "cp -iv";
        mv = "mv iv";
        rm = "trash-put";
        cat = "bat";
        vim = "nvim";

        };
    };
    # STARTSHIP
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        enableBashIntegration = true;
        enableFishIntegration = true;
      };

    # zsh
    programs.zsh = {
        enable = true;
        oh-my-zsh.enable = true;
        syntaxHighlighting.enable = true;
        enableAutosuggestions = true;
        oh-my-zsh.plugins = [
        "git"
        "sudo"
        "vi-mode"
        "z"
        ];
      shellAliases = {
        cp = "cp -iv";
        mv = "mv iv";
        rm = "trash-put";
        cat = "bat";
        vim = "nvim";
        };
      };
     # TMUX
     programs.tmux = {
         enable = true;
         mouse = true;
         shortcut = "a";
         plugins = with pkgs.tmuxPlugins; [
          sensible
          pain-control
          yank
          prefix-highlight
          better-mouse-mode
         ];
       };
############################ Batas Program

  programs.home-manager.enable = true;
  # font.fontconfig.enable = true;
  # direnv
  programs = {
    direnv = {
      enable = true;
      # enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    bash.enable = true; # see note on other shells below
  };
}
