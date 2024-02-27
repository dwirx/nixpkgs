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
      ls = "lsd";
      la = "ls -A";
      l = "ls -Alh";
      ll = "ls -Al";
      lt = "ls --tree";
      lta = "ls -A --tree";

      rm = "trash-put";
      cat = "bat";
      vim = "nvim";
      g = "git";
      lg = "lazygit";
      mans = '' man -k  . | cut -d " " -f 1 | fzf -m --preview "man {1}" '';
      grep = "rg";
      nf = "neofetch";
      # Tflake="cp ~/.config/nixpkgs/template/flake.nix ./flake.nix";

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

            #Template
            # Fungsi untuk menyalin flake.nix ke folder yang dipilih
      copy_flake() {
          echo "Pilih folder tempat Anda ingin menyalin flake.nix:"

          # Menampilkan daftar folder dalam direktori template
          select folder in ~/.config/nixpkgs/template/*; do
              if [ -n "$folder" ]; then
                  if [ -d "$folder" ]; then
                      cp "$folder/flake.nix" ./
                      echo "flake.nix berhasil disalin ke $folder"
                  else
                      echo "Pilihan tidak valid. Harap pilih folder."
                  fi
                  break
              else
                  echo "Pilihan tidak valid. Harap pilih folder."
              fi
          done
      }

      # Fungsi untuk memanggil fungsi copy_flake
      choose_flake() {
          copy_flake
      }

      # Alias untuk memudahkan pemanggilan
      alias Tflake=choose_flake




    '';
  };
}
