{
  config,
  hostName,
  ...
}: let
  name = config.home.username;
  mail = hostName;
in {
  programs.git = {
    enable = true;
    settings = {
      user.name = name;
      user.email = "${name}@${mail}";
      init.defaultBranch = "main";
      pull.rebase = true;
      color.ui = "auto";
    };
  };
}
