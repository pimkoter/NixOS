{config, ...}: let
  colors = config.stylix.base16Scheme;
in {
  xdg.configFile."niri/config.kdl".text = ''

    // =====================
    // STARTUP APPS
    // =====================

        spawn-at-startup "noctalia-shell"
        spawn-at-startup "spotify"
        spawn-at-startup "vesktop"

        spawn-at-startup "kitty --class=decor-kitty -e cava";

    // =====================
    // KEYBINDS
    // =====================
    binds {

        // --- Help ---
        Mod+Shift+Slash { show-hotkey-overlay; }


        // --- Applications ---
        Mod+Space	 cooldown-ms=200            { spawn-sh "noctalia-shell ipc call launcher toggle"; }

        Mod+T		 cooldown-ms=200            { spawn "kitty"; }
        Mod+D		 cooldown-ms=200            { spawn "legcord"; }
        Mod+F		 cooldown-ms=200            { spawn "nautilus"; }
        Mod+B		 cooldown-ms=200            { spawn "zen-beta"; }
        Mod+S		 cooldown-ms=200            { spawn "steam"; }
        Mod+Shift+M  cooldown-ms=200            { spawn "pavucontrol"; }
        Mod+Y        cooldown-ms=200            { spawn "kitty" "yazi" ; }

        Mod+Ctrl+T { spawn "kitty" "--class=floating-kitty"; }

        // --- Lock / Accessibility ---
        Super+Alt+L  cooldown-ms=200            { spawn-sh "noctalia-shell ipc call lockScreen toggle"; }

        // --- Media / Volume ---
        XF86AudioRaiseVolume allow-when-locked=true {
            spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
        }
        XF86AudioLowerVolume allow-when-locked=true {
            spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
        }
        XF86AudioMute allow-when-locked=true {
            spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        }
        XF86AudioMicMute allow-when-locked=true {
            spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        }
        XF86AudioPlay allow-when-locked=true { spawn-sh "playerctl play-pause"; }
        XF86AudioStop allow-when-locked=true { spawn-sh "playerctl stop"; }
        XF86AudioPrev allow-when-locked=true { spawn-sh "playerctl previous"; }
        XF86AudioNext allow-when-locked=true { spawn-sh "playerctl next"; }

        // --- Brightness ---
        XF86MonBrightnessUp allow-when-locked=true {
            spawn "brightnessctl" "--class=backlight" "set" "+10%";
        }
        XF86MonBrightnessDown allow-when-locked=true {
            spawn "brightnessctl" "--class=backlight" "set" "10%-";
        }

    // --- Window / Column Navigation ---
        Mod+Q repeat=false { close-window; }
        Mod+X repeat=false { toggle-overview; }

        Mod+H { focus-column-left; }
        Mod+J { focus-window-down; }
        Mod+K { focus-window-up; }
        Mod+L { focus-column-right; }

        Mod+Left  { focus-column-left; }
        Mod+Down  { focus-window-down; }
        Mod+Up    { focus-window-up; }
        Mod+Right { focus-column-right; }

        // --- Move Windows / Columns ---
        Mod+Shift+Left  { move-column-left; }
        Mod+Shift+Right { move-column-right; }

        Mod+Ctrl+H { move-column-left; }
        Mod+Ctrl+L { move-column-right; }

        Mod+Home        { focus-column-first; }
        Mod+End         { focus-column-last; }
        Mod+Ctrl+Home   { move-column-to-first; }
        Mod+Ctrl+End    { move-column-to-last; }

        // --- Monitor Focus ---
        Mod+Shift+H { focus-monitor-left; }
        Mod+Shift+L { focus-monitor-right; }

        Mod+Shift+Ctrl+H { move-column-to-monitor-left; }
        Mod+Shift+Ctrl+L { move-column-to-monitor-right; }

        // --- Workspaces ---
        Mod+Shift+J { focus-workspace-down; }
        Mod+Shift+K { focus-workspace-up; }

        Mod+Ctrl+J { move-column-to-workspace-down; }
        Mod+Ctrl+K { move-column-to-workspace-up; }

        // Workspace numbers
        Mod+1 { focus-workspace 1; }
        Mod+2 { focus-workspace 2; }
        Mod+3 { focus-workspace 3; }
        Mod+4 { focus-workspace 4; }
        Mod+5 { focus-workspace 5; }
        Mod+6 { focus-workspace 6; }
        Mod+7 { focus-workspace 7; }
        Mod+8 { focus-workspace 8; }
        Mod+9 { focus-workspace 9; }
        Mod+Ctrl+1 { move-column-to-workspace 1; }
        Mod+Ctrl+2 { move-column-to-workspace 2; }
        Mod+Ctrl+3 { move-column-to-workspace 3; }
        Mod+Ctrl+4 { move-column-to-workspace 4; }
        Mod+Ctrl+5 { move-column-to-workspace 5; }
        Mod+Ctrl+6 { move-column-to-workspace 6; }
        Mod+Ctrl+7 { move-column-to-workspace 7; }
        Mod+Ctrl+8 { move-column-to-workspace 8; }
        Mod+Ctrl+9 { move-column-to-workspace 9; }

        // --- Column Layout ---
        Mod+R        { switch-preset-column-width; }
        Mod+Shift+R  { switch-preset-window-height; }
        Mod+Ctrl+R   { reset-window-height; }

        Mod+Minus { set-column-width "-10%"; }
        Mod+Equal { set-column-width "+10%"; }

        Mod+Shift+Minus { set-window-height "-10%"; }
        Mod+Shift+Equal { set-window-height "+10%"; }

        Mod+Shift+F  { maximize-column; }
        Mod+Control+F { fullscreen-window; }

        Mod+C      { center-column; }
        Mod+Alt+C  { center-visible-columns; }

        // --- Floating / Tabs ---
        Mod+W       { toggle-window-floating; }
        Mod+Shift+W { switch-focus-between-floating-and-tiling; }
        Mod+V       { toggle-column-tabbed-display; }

        // --- Screenshots ---
        Mod+Shift+S { screenshot; }
        Ctrl+Print  { screenshot-screen; }
        Alt+Print   { screenshot-window; }

        // --- System ---
        Mod+Escape allow-inhibiting=false {
            toggle-keyboard-shortcuts-inhibit;
        }
        Mod+Shift+E { quit; }
        Ctrl+Alt+Delete { quit; }
        Mod+Shift+P { power-off-monitors; }
    }
    // =====================
    // ENVIRONMENT
    // =====================

    hotkey-overlay {
        skip-at-startup
    }

    environment {
        QT_QPA_PLATFORM "wayland"
        ELECTRON_OZONE_PLATFORM_HINT "auto"
        QT_QPA_PLATFORMTHEME "kvantum"
        QT_STYLE_OVERRIDE "kvantum"
        TERMINAL "kitty"
        XCURSOR_THEME "Bibata-Modern-Ice"
        XCURSOR_SIZE "24"
    }

    // =====================
    // INPUT
    // =====================
    input {
        keyboard {
            xkb {}
            numlock
        }

        touchpad {
            tap
            natural-scroll
        }

        mouse {}
        trackpoint {}

        focus-follows-mouse max-scroll-amount="0%"
    }

    // =====================
    // LAYOUT
    // =====================
    layout {
        gaps 9
        center-focused-column "on-overflow"
        always-center-single-column

        preset-column-widths {
            proportion 0.33333
            proportion 0.5
            proportion 0.66667
            proportion 1.0
        }

        default-column-width { proportion 0.5; }

        focus-ring {
            off
        }

        border {
            width 2
            active-color "#${colors.base0D}"
            inactive-color "#${colors.base03}"
            urgent-color "#${colors.base08}"
        }

        shadow {
            on
            softness 30
            spread 5
            offset x=0 y=5
            color "#0007"
        }

        struts {}
    }

    // =====================
    // OUTPUTS
    // =====================
    output "DP-4" {
        mode "1920x1080@60"
        position x=0    y=0
    }

    output "DP-6" {
        mode "1920x1080@164.999"
        position x=1920 y=0
    }

    output "eDP-2" {
        mode "2560x1080@60"
        scale 1.5
        position x=3840 y=0
    }

    // =====================
    // WINDOW RULES
    // =====================

    prefer-no-csd true

    window-rule {
        geometry-corner-radius 9
        clip-to-geometry true
        draw-border-with-background false
    }

    window-rule {
        match app-id="Minecraft"
        open-fullscreen true
        max-width 1920
        max-height 1080
    }

    window-rule {
        match app-id=r#"^decor-kitty$"#
        open-floating true
        open-focused false
        baba-is-float true
        draw-border-with-background false
        opacity 0.4

        default-column-width { fixed 600; }
        default-window-height { fixed 400; }
    }

  '';
}
