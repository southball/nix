{ config, pkgs, ... }:
			  
{
  home.username = "southball";
  home.homeDirectory = "/home/southball";

  home.stateVersion = "21.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git delta
    ocaml opam coq
    rustup gcc pkg-config openssl
    postgresql sqlite
    nodePackages.gitmoji-cli
    nodejs yarn
    jdk gradle
    docker-compose
    ansible
    nodePackages.http-server
    bat
  ];

  programs.bash = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Southball";
    userEmail = "jamie.choi.mail.2002@gmail.com";
    aliases = {
      lg = "lg1";
      lg1 = "lg1-specific --all";
      lg2 = "lg2-specific --all";
      lg3 = "lg3-specific --all";

      lg1-specific = "log --graph --abbrev-commit --decorate --format=format:\'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)\'";
      lg2-specific = "log --graph --abbrev-commit --decorate --format=format:\'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n\'\'          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)\'";
      lg3-specific = "log --graph --abbrev-commit --decorate --format=format:\'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n\'\'          %C(white)%s%C(reset)%n\'\'          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)\'";
    };
    extraConfig = {
      core = { hooksPath = ".githooks"; };
      pager = {
        diff = "${pkgs.delta}/bin/delta";
        log = "${pkgs.delta}/bin/delta";
        reflog = "${pkgs.delta}/bin/delta";
        show = "${pkgs.delta}/bin/delta";
      };
    };
  };
  
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
  };

  programs.neovim = {
    enable = true;
    extraConfig = builtins.readFile ./neovim.vim;
  };

  programs.emacs = {
    enable = true;
    extraConfig = builtins.readFile ./emacs.el;
    extraPackages = epkgs: [
      epkgs.undo-tree
      epkgs.proof-general
      epkgs.company-coq
      epkgs.evil
    ];
  };
  
  home.file.".config/gitmoji-nodejs/config.json".text = builtins.readFile ./gitmoji-config.json;
}
