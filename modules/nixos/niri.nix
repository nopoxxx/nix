{ config, pkgs, user, ... }: {
  programs.niri.enable = true;
  system.activationScripts.niriConfig = ''
    mkdir -p /home/${user}/.config/niri
    cat > /home/${user}/.config/niri/config.kdl << 'EOF'
input {

    keyboard {
        xkb {
            layout "us,ru"
            options "grp:alt_shift_toggle,compose:ralt,ctrl:nocaps"
        }
        numlock
    }

    mouse {
        accel-speed 0.25
        accel-profile "flat"
    }

    focus-follows-mouse max-scroll-amount="0%"
}

layout {
    gaps 4
    center-focused-column "on-overflow"

    preset-column-widths {
        proportion 0.33333
        proportion 0.5
        proportion 0.66667
    }

    default-column-width { proportion 1.0; }

    focus-ring {
        off
    }

    border {
        // off

        width 2
        active-color "#ffc87f"
        inactive-color "#505050"
        urgent-color "#9b0000"
    }
}

spawn-at-startup "waybar"

hotkey-overlay {
    skip-at-startup
}

prefer-no-csd

screenshot-path "~/Pictures/Screenshots/Screenshot_%Y-%m-%d %H-%M-%S.png"

window-rule {
    match app-id=r#"firefox$"# title="^Picture-in-Picture$"
    open-floating true
}

window-rule {
    match app-id="steam" title=r#"^notificationtoasts_\d+_desktop$"#

    open-floating true
    open-floating-position x=10 y=10 relative-to="bottom-right"
}

binds {
    Mod+Shift+Slash { show-hotkey-overlay; }

    Mod+Return hotkey-overlay-title="Open a Terminal: kitty" { spawn "kitty"; }
    Mod+E hotkey-overlay-title="Open a File Manager: nautilus" { spawn "nautilus"; }

    Mod+Q repeat=false { close-window; }

    Mod+Left  { focus-column-left; }
    Mod+Down  { focus-window-down; }
    Mod+Up    { focus-window-up; }
    Mod+Right { focus-column-right; }
    Mod+H     { focus-column-left; }
    Mod+J     { focus-window-down; }
    Mod+K     { focus-window-up; }
    Mod+L     { focus-column-right; }

    Mod+Ctrl+Left  { move-column-left; }
    Mod+Ctrl+Down  { move-window-down; }
    Mod+Ctrl+Up    { move-window-up; }
    Mod+Ctrl+Right { move-column-right; }
    Mod+Ctrl+H     { move-column-left; }
    Mod+Ctrl+J     { move-window-down; }
    Mod+Ctrl+K     { move-window-up; }
    Mod+Ctrl+L     { move-column-right; }

    Mod+Shift+Left  { focus-monitor-left; }
    Mod+Shift+Down  { focus-monitor-down; }
    Mod+Shift+Up    { focus-monitor-up; }
    Mod+Shift+Right { focus-monitor-right; }
    Mod+Shift+H     { focus-monitor-left; }
    Mod+Shift+J     { focus-monitor-down; }
    Mod+Shift+K     { focus-monitor-up; }
    Mod+Shift+L     { focus-monitor-right; }

    Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
    Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
    Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
    Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
    Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
    Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
    Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
    Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }


    Mod+Shift+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
    Mod+Shift+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
    Mod+Shift+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
    Mod+Shift+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

    Mod+WheelScrollDown      { focus-column-right; }
    Mod+WheelScrollUp        { focus-column-left; }
    Mod+Ctrl+WheelScrollDown { move-column-right; }
    Mod+Ctrl+WheelScrollUp   { move-column-left; }

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

    Mod+BracketLeft  { consume-or-expel-window-left; }
    Mod+BracketRight { consume-or-expel-window-right; }

    Mod+R { switch-preset-column-width; }
    Mod+Shift+R { switch-preset-window-height; }
    Mod+F { maximize-column; }
    Mod+Shift+F { fullscreen-window; }

    Mod+Ctrl+F { expand-column-to-available-width; }

    Mod+Minus { set-column-width "-10%"; }
    Mod+Equal { set-column-width "+10%"; }

    Mod+Shift+Minus { set-window-height "-10%"; }
    Mod+Shift+Equal { set-window-height "+10%"; }

    Mod+T       { toggle-window-floating; }
    Mod+Shift+T { switch-focus-between-floating-and-tiling; }

    Mod+Shift+S { screenshot; }
    Ctrl+Print { screenshot-screen; }
    Alt+Print { screenshot-window; }
}

include "dms/alttab.kdl"
include "dms/colors.kdl"
include "dms/layout.kdl"
include "dms/outputs.kdl"
include "dms/cursor.kdl"
include "dms/binds.kdl"
include "dms/windowrules.kdl"
include "dms/wpblur.kdl"
EOF
    chown -R ${user}:users /home/${user}/.config/niri
  '';
}