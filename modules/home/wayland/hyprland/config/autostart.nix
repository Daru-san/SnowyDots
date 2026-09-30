{
  config,
  pkgs,
  lib,
  osConfig,
  ...
}:
let
  inherit (lib) getExe;
  mkLua = lib.generators.mkLuaInline;
  toLua = args: lib.generators.toLua { } args;
  foot = getExe config.programs.foot.package;
in
{
  wayland.windowManager.hyprland.settings = {
    on = {
      _args =
        let
          mkCmd = cmd: args: "hl.exec_cmd(\"${cmd}\", ${toLua args})";
          commands =
            (map (cmd: (mkCmd cmd { })) [
              (getExe pkgs.copyq)
              "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent"
            ])
            ++ [
              (mkCmd "${foot}" { workspace = 1; })
              (mkCmd "${foot} -e ${osConfig.security.wrapperDir}/btop" { workspace = 3; })
            ];
        in
        [
          "hyprland.start"
          (mkLua /* lua */ ''
            function()
              ${lib.concatLines commands}
            end
          '')
        ];
    };
  };
}
