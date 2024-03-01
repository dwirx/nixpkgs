{ config, pkgs, lib, ... }:

let
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
  shellAliases = with pkgs;
    {
      tg = "tree --gitignore";
      # Nix related
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
      nb = "nix build";
      ndp = "nix develop";
      nfe = "nix flake";
      nr = "nix run";
      ns = "nix-shell";
      nq = "nix search";
      # Cryptography
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
