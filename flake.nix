{
  description = "react-native via nix flakes";

  inputs.nixpkgs.url = "nixpkgs/988cc958c57ce4350ec248d2d53087777f9e1949";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
  { self
  , nixpkgs
  , flake-utils
  }:
    flake-utils.lib.eachDefaultSystem
    ( system:

      let 
        pkgs = import nixpkgs 
        { 
          inherit system;

          config = 
          {
            android_sdk.accept_license = true; 
            allowUnfreePredicate = pkg: builtins.elem (builtins.parseDrvName pkg.name).name
            [
               "androidsdk"
            ];
          };
        };

        env-android = import ./nix/env-android.nix { inherit pkgs; };

        builds = import ./nix/builds.nix 
        { inherit 
          pkgs
          env-android 
        ;
        };

        shells = import ./nix/shells.nix 
        { inherit 
          pkgs
          env-android 
        ;
        };

      in
      {
        defaultPackage = builds.android-debug-react;

        packages.android-debug-gradle = builds.android-debug-gradle; 
        packages.android-debug-react  = builds.android-debug-react; 

        devShells.default = shells.devShells.default;
      }
    );
}
