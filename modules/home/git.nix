{userdata, ...}: let
  name = userdata.user;
  mail = userdata.host;
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
