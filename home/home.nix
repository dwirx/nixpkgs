{ pkgs, ... }: {
  home.username = "hades";
  home.homeDirectory = "/home/hades";
  home.stateVersion = "23.11"; # Please read the comment before changing.
  programs.neovim.enable = true;
  home.packages = with pkgs; [
    bat
    vim
    # btop
    gdu
    nodejs
    cargo

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
    lazygit
    ripgrep
    man
    jq


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
      lg = "lazygit";
      mans = '' man -k  . | cut -d " " -f 1 | fzf -m --preview "man {1}" '';
      grep = "rg";

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
    enableCompletion = true;
    defaultKeymap = "viins";
    oh-my-zsh.plugins = [
      "git"
      "sudo"
      "vi-mode"
      "z"
    ];
    shellAliases = {
      cp = "cp -iv";
      # mv = "mv iv";
      rm = "trash-put";
      cat = "bat";
      vim = "nvim";
      lg = "lazygit";
      mans = '' man -k  . | cut -d " " -f 1 | fzf -m --preview "man {1}" '';
      grep = "rg";
      nf = "neofetch";
    };
    initExtraFirst = ''
      # vi mode confi
      VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
      VI_MODE_SET_CURSOR=true
      MODE_INDICATOR="%F{yellow}+%f"
      KEYTIMEOUT=15
      VI_MODE_PROMPT_INFO=true

      #Git
      function gsts (){git status}
      function gc (){git commit -am "$@"}
      function ga (){git add "$@"}
      function gs (){git switch "$@"}
      function gm (){git merge "$@"}
      function gcb (){git checkout -b "$@"}
      function gca (){git commit --amend --no-edit -m "$@"}
      function gu (){git reset --soft HEAD~1}
      function gst (){git stash "$@"}
      function gstp (){git stash pop "$@"}
      function grmc (){git rm --cached "$@"}

      function gpo (){git push origin "$@"}
      function gplo (){git pull origin "$@"}
      function gpu (){git push upstream "$@"}
      function gplu (){git pull upstream  "$@"}


      function gsm (){gs "master"}

      function gpom (){gpo "master"}
      function gpum (){gpu "master"}

      function gplom (){gplo "master"}
      function gplum (){gplu "master"}

      function gplob (){gplo "$(git symbolic-ref --short HEAD)"}
      function gplub (){gplu "$(git symbolic-ref --short HEAD)"}

      function gpob (){gpo "$(git symbolic-ref --short HEAD)"}
      function gpub (){gpu "$(git symbolic-ref --short HEAD)"}


    '';
  };
  # TMUX
  programs.tmux = {
    enable = true;
    mouse = true;
    # shortcut = "a";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      pain-control
      yank
      prefix-highlight
      better-mouse-mode
    ];
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = ''
      bind-key ` last-window
      bind-key e send-prefix
      set -g status-position bottom
      set -g status-bg colour234
      set -g status-fg colour137
      set -g status-left ""
      set -g status-right '#[fg=colour233,bg=colour241,bold] %d/%m #[fg=colour233,bg=colour245,bold] %H:%M:%S '
      set -g status-right-length 50
      set -g status-left-length 20
      setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '
      setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '

      # vim key to switch window and session
      bind -r j previous-window
      bind -r k next-window
      bind -r h switch-client -p
      bind -r l switch-client -n

      # vim key to move pane
      bind -r K select-pane -U
      bind -r J select-pane -D
      bind -r H select-pane -R
      bind -r L select-pane -L

      # resize pane
      bind -r C-k resize-pane -U 5
      bind -r C-j resize-pane -D 5
      bind -r C-h resize-pane -L 5
      bind -r C-l resize-pane -R 5

      # Setting yank
      set -g @yank_highlight 'true'
      set -g @yank_highlight_cursor 'true'
    '';
    prefix = "`";
    keyMode = "vi";
    historyLimit = 10000;
    baseIndex = 1;
    escapeTime = 1;
  };
  #eza
  programs.git = {
    enable = true;
  };


  ############################ Batas Program

  programs.home-manager.enable = true;
  # font.fontconfig.enable = true;
  # direnv
  imports = [
    ./btop.nix
    ./shell.nix

  ];
  programs = {
    direnv = {
      enable = true;
      # enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    bash.enable = true; # see note on other shells below
  };
}
