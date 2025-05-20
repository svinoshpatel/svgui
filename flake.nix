{
  description = "svgui flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    pkgs.stdenv.mkDerivation {
      name = "svgui";
      src = self;
      nativeBuildInputs = [ pkgs.qt6.wrapQtAppsHook ];
      buildInputs = [
        pkgs.cmake
        pkgs.qt6.qtbase
        pkgs.qt6.qtdeclarative
      ];
      configurePhase = ''
        mkdir -p build
        cd build
        cmake ../src
      '';
      buildPhase = ''
        make
      '';
      installPhase = ''
        mkdir -p $out/bin
        mv appsrc $out/bin/svgui
      '';
    };

    devShell.x86_64-linux = let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    pkgs.mkShell {
      buildInputs = [
        pkgs.cmake
        pkgs.qt6.qtbase
        pkgs.qt6.qtdeclarative
        pkgs.qtcreator
      ];
    };
  };
}
