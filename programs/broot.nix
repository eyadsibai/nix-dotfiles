programs.broot = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    verbs = {
  "p" = { execution = ":parent"; };
  "edit" = { shortcut = "e"; execution = "$EDITOR {file}" ; };
  "create {subpath}" = { execution = "$EDITOR {directory}/{subpath}"; };
  "view" = { execution = "less {file}"; };
  "blop {name}\\.{type}" = {
    execution = "/bin/mkdir {parent}/{type} && /usr/bin/nvim {parent}/{type}/{name}.{type}";
    from_shell = true;
  };
};

}
