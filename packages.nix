{ config, pkgs, ... }:

{
  users.users."caleb".packages = with pkgs; [
    # Games
    mindustry
    graphwar
    prismlauncher

    # General Packages
    fastfetch
    libreoffice-qt
    grub2
    gnome-disk-utility

    #Development
    python3
    zig
    zls
    arduino-cli
    gcc
    gnumake
    gdb
    git
    sshfs

    putty

    # Editors
    neovim
    ghidra
    kdePackages.kate
    arduino-ide
    (vscode-with-extensions.override {
      vscode = pkgs.vscode.overrideAttrs (old: {
        postPatch = builtins.replaceStrings
          [ "resources/app/node_modules/@vscode/ripgrep/bin/rg" ]
          [ "resources/app/node_modules/@vscode/ripgrep-universal/bin/linux-x64/rg" ]
          old.postPatch;
      });
      vscodeExtensions = with vscode-extensions; [
        ms-python.python
        llvm-vs-code-extensions.vscode-clangd
        ms-vscode.cpptools
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "byu-cs-code-recorder";
          publisher = "byu-cs-course-ops";
          version = "2026.6.2";
          hash = "sha256-l3Icm5hTVHQhL9dgbCHbxxl7Q+djeH9/DOvAhcggtj4=";
        }
        {
          name = "platformio-ide";
          publisher = "platformio";
          version = "3.3.4"; # Adjust to the version you prefer
          sha256 = "sha256-qfNz4IYjCmCMFLtAkbGTW5xnsVT8iDnFWjrgkmr2Slk=";
        }
      ];
    })
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    # Add any other libraries if specific tools complain about missing .so files
  ];
}
