{ config, pkgs, ... }:

{
	xdg.configFile."niri/config.kdl".source = ./config.kdl;
	xdg.configFile."swaylock/config".source = ./swaylock.conf;
}
