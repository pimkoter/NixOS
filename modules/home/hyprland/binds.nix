{host, ...}: let
  inherit
    (import ../../../hosts/${host}/variables.nix)
    browser
    terminal
    barChoice
    modifier
    ;

  # Import host-specific binds
  hostBinds = import ./hosts/${host}/binds.nix {inherit host;};

  # Determine launcher command based on barChoice
  launcherCommand =
    if barChoice == "noctalia"
    then "noctalia-shell ipc call launcher toggle"
    else if barChoice == "dms"
    then "$HOME/.local/bin/dms ipc call spotlight toggle"
    else "rofi-launcher";

  # Noctalia-specific keybinds
  noctaliaBinds =
    if barChoice == "noctalia"
    then [
      "SUPER,comma,exec,noctalia-shell ipc call settings toggle"
      "SUPER ALT,S,exec,noctalia-shell ipc call settings toggle"
      "SUPER SHIFT,C,exec,noctalia-shell ipc call controlCenter toggle"
    ]
    else [];

  # DMS-specific keybinds
  dmsBinds =
    if barChoice == "dms"
    then [
      "SUPER,comma,exec,ignis open-window Settings"
      "SUPER SHIFT,V,exec,$HOME/.local/bin/dms ipc call clipboard toggle"
      "SUPER,M,exec,$HOME/.local/bin/dms ipc call processlist toggle"
      "SUPER ALT,S,exec,$HOME/.local/bin/dms ipc call settings toggle"
      "SUPER,N,exec,$HOME/.local/bin/dms ipc call notifications toggle"
      "SUPER SHIFT,N,exec,$HOME/.local/bin/dms ipc call notepad toggle"
      "SUPER ALT,L,exec,$HOME/.local/bin/dms ipc call lock lock"
      "CTRL ALT,Delete,exec,$HOME/.local/bin/dms ipc call processlist toggle"
      ",XF86AudioRaiseVolume,exec,$HOME/.local/bin/dms ipc call audio increment 3"
      ",XF86AudioLowerVolume,exec,$HOME/.local/bin/dms ipc call audio decrement 3"
      ",XF86AudioMute,exec,$HOME/.local/bin/dms ipc call audio mute"
      ",XF86AudioMicMute,exec,$HOME/.local/bin/dms ipc call audio micmute"
      ",XF86MonBrightnessDown,exec,$HOME/.local/bin/dms ipc call brightness decrement 5 ''"
      ",XF86MonBrightnessUp,exec,$HOME/.local/bin/dms ipc call brightness increment 5 ''"
    ]
    else [];

  # Default binds that all hosts inherit
  defaultBinds =
    [
      "SUPER,T,exec,${terminal}"
      "SUPER SHIFT CTRL,D,exec,nwg-displays"
      "SUPER ALT,M,exec,appimage-run ./Moonlight-6.1.0-x86_64.AppImage"
      "SUPER,K,exec,list-keybinds"
      "SUPER,Z,exec,zeditor"
      "SUPER,SPACE,exec,${launcherCommand}"
      "SUPER SHIFT,W,exec,web-search"
      "SUPER ALT,W,exec,wallsetter"
      "SUPER,B,exec,${browser}"
      "SUPER,Y,exec,kitty -e yazi"
      "SUPER CTRL,E,exec,emopicker9000"
      "SUPER,V,exec,legcord"
      "SUPER SHIFT,S,exec,screenshootin"
      "SUPER SHIFT,V,exec,virt-manager"
      "SUPER,S,exec,steam"
      "SUPER SHIFT,O,exec,flatpak run com.obsproject.Studio"
      "SUPER SHIFT,Z,exec,zeditor"
      "SUPER,C,exec,hyprpicker -a"
      "SUPER,L,exec,hyprlock"
      "SUPER,X,exec,wlogout"
      "SUPER,G,exec,telegram-desktop"
      "SUPER SHIFT,T,exec,pypr toggle term"
      "SUPER,M,exec,pavucontrol"
      "SUPER,R,layoutmsg,colresize +conf"
      "SUPER SHIFT,R,layoutmsg,colresize -conf"
      "SUPER CTRL,R,layoutmsg,colresize 0.5"
      "SUPER,minus,resizeactive,-10% -10%"
      "SUPER,equal,resizeactive,10% 10%"
      "SUPER SHIFT,minus,resizewindowpixel,-30% -30%"
      "SUPER SHIFT,equal,resizewindowpixel,30% 30%"
      "SUPER,Q,killactive,"
      "SUPER,P,pseudo,"
      "SUPER SHIFT,I,togglesplit,"
      "SUPER SHIFT,F,fullscreen,"
      "SUPER CTRL,F,fullscreen,1"
      "SUPER,F,exec,thunar"
      "SUPER,W,togglefloating,"
      "SUPER SHIFT CTRL,W,workspaceopt, allfloat"
      "SUPER SHIFT,left,layoutmsg,swapcol l"
      "SUPER SHIFT,right,layoutmsg,swapcol r"
      "SUPER SHIFT,up,swapwindow,u"
      "SUPER SHIFT,down,swapwindow,d"
      "SUPER SHIFT,h,movewindow,l"
      "SUPER SHIFT,l,movewindow,r"
      "SUPER SHIFT,k,movewindow,u"
      "SUPER SHIFT,j,movewindow,d"
      "SUPER ALT, left, swapwindow,l"
      "SUPER ALT, right, swapwindow,r"
      "SUPER ALT, up, swapwindow,u"
      "SUPER ALT, down, swapwindow,d"
      "SUPER ALT, 43, swapwindow,l"
      "SUPER ALT, 46, swapwindow,r"
      "SUPER ALT, 45, swapwindow,u"
      "SUPER ALT, 44, swapwindow,d"
      "SUPER,left,movefocus,l"
      "SUPER,right,movefocus,r"
      "SUPER,up,movefocus,u"
      "SUPER,down,movefocus,d"
      #"SUPER,h,movefocus,l"
      #"SUPER,l,movefocus,r"
      #"SUPER,k,movefocus,u"
      #"SUPER,j,movefocus,d"
      "SUPER,1,workspace,1"
      "SUPER,2,workspace,2"
      "SUPER,3,workspace,3"
      "SUPER,4,workspace,4"
      "SUPER,5,workspace,5"
      "SUPER,6,workspace,6"
      "SUPER,7,workspace,7"
      "SUPER,8,workspace,8"
      "SUPER,9,workspace,9"
      "SUPER,0,workspace,10"
      #"SUPER SHIFT,SPACE,movetoworkspace,special"
      #"SUPER,SPACE,togglespecialworkspace"
      "SUPER SHIFT,1,movetoworkspace,1"
      "SUPER SHIFT,2,movetoworkspace,2"
      "SUPER SHIFT,3,movetoworkspace,3"
      "SUPER SHIFT,4,movetoworkspace,4"
      "SUPER SHIFT,5,movetoworkspace,5"
      "SUPER SHIFT,6,movetoworkspace,6"
      "SUPER SHIFT,7,movetoworkspace,7"
      "SUPER SHIFT,8,movetoworkspace,8"
      "SUPER SHIFT,9,movetoworkspace,9"
      "SUPER SHIFT,0,movetoworkspace,10"
      "SUPER Ctrl Alt,down, movetoworkspace, r+1"
      "SUPER Ctrl Alt,up, movetoworkspace, r-1"
      "SUPER CONTROL,down,workspace,r+1"
      "SUPER CONTROL,up,workspace,r-1"
      "SUPER CTRL,mouse_down,workspace, r+1"
      "SUPER CTRL,mouse_up,workspace, r-1"
      "ALT,Tab,cyclenext"
      "ALT,Tab,bringactivetotop"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPause, exec, playerctl play-pause"
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPrev, exec, playerctl previous"
    ]
    # Audio and brightness binds (only when DMS is not active)
    ++ (
      if barChoice != "dms"
      then [
        ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        " ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
        ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
      ]
      else []
    );

  # Default mouse binds
  defaultBindm = [
    "SUPER, mouse:272, movewindow"
    "SUPER, mouse:273, resizewindow"
  ];
in {
  wayland.windowManager.hyprland.settings = {
    # Merge default binds with host-specific binds and conditional shell binds
    bind = defaultBinds ++ noctaliaBinds ++ dmsBinds ++ hostBinds.bind;
    bindm = defaultBindm ++ hostBinds.bindm;
  };
}
