{ ... }: {
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
      # ls = "lsd";
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

      ### "bat" as manpager
      # export MANPAGER="sh -c 'col -bx | bat -l man -p'"
      # export MANPAGER="nvim -c 'set ft=man' -"




    '';
  };
}
