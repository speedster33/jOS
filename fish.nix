{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting ""
      
      set fish_color_command green
      set fish_color_comment brblack
      set fish_color_cwd cyan
      set fish_color_end red
      set fish_color_error orange
      set fish_color_host blue
      set fish_color_operator brblue
      set fish_color_params brgreen
      set fish_color_quote grey
      set fish_color_redirection yellow
      set fish_color_user green
      
      fish_vi_key_bindings
      fish_vi_cursor
    '';
  };
}
