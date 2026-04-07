{ pkgs, ... }:
{
  stylix.targets.vscode.enable = false;
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.extensions = import ./extensions.nix { inherit pkgs; };
    profiles.default.userSettings = {
      chat.editor.fontFamily = "iA Writer Mono V";
      chat.editor.fontSize = 16.0;
      chat.fontFamily = "iA Writer Quattro S";
      debug.console.fontFamily = "iA Writer Mono V";
      debug.console.fontSize = 16.0;
      editor.fontFamily = "iA Writer Mono V";
      editor.fontSize = 16.0;
      editor.inlayHints.fontFamily = "iA Writer Mono V";
      editor.inlineSuggest.fontFamily = "iA Writer Mono V";
      editor.minimap.sectionHeaderFontSize = 10.285714285714286;
      markdown.preview.fontFamily = "iA Writer Quattro S";
      markdown.preview.fontSize = 16.0;
      notebook.markup.fontFamily = "iA Writer Quattro S";
      scm.inputFontFamily = "iA Writer Mono V";
      scm.inputFontSize = 14.857142857142858;
      screencastMode.fontSize = 64.0;
      terminal.integrated.fontSize = 16.0;
      workbench.colorTheme = "Gruvbox Dark Medium";
    };
  };
}
