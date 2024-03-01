{ config, pkgs, lib, ... }:

let
  inherit (config.home.user-info) nixConfigDirectory;
  inherit (lib) mkAfter;
  # usefull when want to write bin bash
  # n = pkgs.writers.writeBash "n" ''
  #     while getopts p flag
  #   do
  #       case "${flag}" in
  #           p) nix develop "my#$1" ${OPTARG};;
  #           *) nix develop "my#$1" -c $SHELL;;
  #       esac
  #   done
  # '';
  commandFoldl' = builtins.foldl' (a: b: a + b + '' &&'') '''';
  shellAliases = with pkgs;
    {
      tg = "tree --gitignore";
      # Nix related
      nclean = commandFoldl' [
        "nix profile wipe-history"
        "nix-collect-garbage"
        "nix-collect-garbage -d"
        "nix-collect-garbage --delete-old"
        "nix store gc"
        "nix store optimise"
        "nix-store --verify --repair --check-contents"
      ];
      drb = "darwin-rebuild build --flake ${nixConfigDirectory}";
      drs = "darwin-rebuild switch --flake ${nixConfigDirectory}";
      psc0 = "nix build ${nixConfigDirectory}#darwinConfigurations.RG.system --json | jq -r '.[].outputs | to_entries[].value' | cachix push r17";
      psc1 = "nix build ${nixConfigDirectory}#darwinConfigurations.eR17.system --json | jq -r '.[].outputs | to_entries[].value' | cachix push r17";

      # secret gpg export
      gpbs = "gpg --export-options backup --export-secret-keys";
      # public gpg export
      gpbp = "gpg --export-options backup --export";
      # secret or public gpg import
      gprs = "gpg --export-options restore --import";
      # gpg trust data
      gpbt = "gpg --export-ownertrust";
      gprt = "gpg --import-ownertrust";

      # lenv show list generations aka list build version
      # senv switch generation <number>
      # denv delete generation <number>
      # renv rollback to previous version number
      # param: <GENEREATION_NUMBER> 
      # run lenv before if you want to see <GENEREATION_NUMBER>
      lenv = "nix-env --list-generations";
      senv = "nix-env --switch-generation";
      denv = "nix-env --delete-generations";
      doenv = "denv old";
      renv = "nix-env --rollback";
      # is equivalent to: nix build --recreate-lock-file
      flakeup-all = "nix flake update ${nixConfigDirectory}";
      # example: 
      # $ flakeup home-manager
      flakeup = "nix flake lock ${nixConfigDirectory} --update-input";
      nb = "nix build";
      ndp = "nix develop";
      nf = "nix flake";
      nr = "nix run";
      ns = "nix-shell";
      nq = "nix search";
      # Cryptography
      age = "${rage}/bin/rage";

      # Shell related
      e = "nvim";
      grep = "${ripgrep}/bin/rg";
      c = "z";
      cc = "zi";
      # Others
      p = "ping";
      l = "ls -l";
      la = "ls -a";
      lla = "ls -la";
      lt = "ls --tree";
      cat = "${bat}/bin/bat";
      du = "${du-dust}/bin/dust";
      git = "${git}/bin/git";
      pullhead = "git pull origin (git rev-parse --abbrev-ref HEAD)";
      tarek = "pullhead";
      pushhead = "git push origin (git rev-parse --abbrev-ref HEAD)";
      gas = "pushhead";
      gasin = "pushhead --force";
      gi = "gitignore";
      g = "git";
      gtemp = "git commit -m \"temp\" --no-verify";
      gf = "git flow";
      gl = "git log --graph --oneline --all";
      gll = "git log --oneline --decorate --all --graph --stat";
      gld = "git log --oneline --all --pretty=format:\"%h%x09%an%x09%ad%x09%s\"";
      gls = "gl --show-signature";
      gfa = "git fetch --all";
      grc = "git rebase --continue";
      rm = "rm -i";

      # Development
      # docker = "${pkgs.podman}/bin/podman";
      # docker-compose = "${pkgs.podman-compose}/bin/podman-compose";
    };
in
{
  home = with pkgs;{
    inherit shellAliases;
    sessionPath = [
      "$HOME/.yarn/bin"
    ];
    packages = with fishPlugins;[
      thefuck
      # https://github.com/franciscolourenco/done
      done
      # use babelfish than foreign-env
      foreign-env
      # https://github.com/wfxr/forgit
      forgit
      # Paired symbols in the command line
      pisces
    ];
  };
}
