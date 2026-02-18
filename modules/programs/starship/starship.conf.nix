{
  flake.modules.homeManager.starship = {
    programs.starship.settings = {
      "$schema" = "https://starship.rs/config-schema.json";

      format = builtins.concatStringsSep "" [
        "[](surface0)"
        "$os"
        "$username($hostname)"
        "([ ](fg:yellow bg:surface0)$nix_shell[ ](fg:yellow bg:surface0))"
        "[](bg:peach fg:surface0)"
        "$directory"
        "[](fg:peach bg:green)"
        "$git_branch"
        "$git_status"
        "[](fg:green bg:blue)"
        "$docker_context"
        "[](fg:blue bg:mauve)"
        "$time"
        "[ ](fg:mauve)"
        "([  ](fg:red)$battery[ ](fg:red))"
        "$line_break$character"
      ];

      palette = "catppuccin_mocha";

      palettes.catppuccin_mocha = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };

      os = {
        disabled = false;
        style = "bg:surface0 fg:text";
        symbols = {
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
          NixOS = "[ ](fg:blue bg:surface0)";
        };
      };

      username = {
        show_always = true;
        style_user = "bg:surface0 fg:text";
        style_root = "bg:surface0 fg:text";
        format = "[ $user ]($style)";
      };

      hostname = {
        ssh_only = false;
        style = "bg:surface0 fg:text";
        format = "[@$hostname$ssh_symbol ]($style)";
      };

      nix_shell = {
        style = "bg:yellow fg:mantle";
        format = "[ ($name) \($state\) ]($style)";
      };

      directory = {
        style = "fg:mantle bg:peach";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Developer" = "󰲋 ";
        };
      };

      git_branch = {
        style = "fg:mantle bg:green";
        format = "[  $branch ]($style)";
      };

      git_status = {
        style = "fg:mantle bg:green";
        format = "[($all_status$ahead_behind )]($style)";
      };

      docker_context = {
        style = "fg:mantle bg:blue";
        format = "[ ( $context) ]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "fg:mantle bg:mauve";
        format = "[  $time ]($style)";
      };

      battery = {
        disabled = false;
        format = "[$symbol$percentage]($style)";
        display = [
          {
            threshold = 10;
            style = "fg:mantle bg:red";
          }
        ];
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[](bold fg:green)";
        error_symbol = "[](bold fg:red)";
        vimcmd_symbol = "[](bold fg:green)";
        vimcmd_replace_one_symbol = "[](bold fg:pink)";
        vimcmd_replace_symbol = "[](bold fg:mauve)";
        vimcmd_visual_symbol = "[](bold fg:lavender)";
      };
    };
  };
}
