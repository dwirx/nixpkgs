{ pkgs,... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = ''
      require('user')
    '';
    extraPackages = [
      pkgs.cargo
    ];
    withNodeJs = true;
    withPython3 = true;
    vimdiffAlias = true;
  };
  
}
