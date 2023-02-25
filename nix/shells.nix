{ pkgs
, env-android 
}:

{
  devShells.default = pkgs.mkShell
  {
    packages = 
    [ 
      pkgs.android-tools 
      pkgs.jdk11_headless 
      pkgs.nodejs

      pkgs.nodePackages.react-native-cli
    ];

    ANDROID_SDK_ROOT = "${env-android.androidRootSdk}";
    ANDROID_NDK_ROOT = "${env-android.androidRootNdk}";

    GRADLE_OPTS = "${env-android.aapt2Override}";

    shellHook = ''
      buildAndroidDebug ()
      {
        react-native build-android --no-packager --extra-params --parallel
      }
    '';
  };
}
