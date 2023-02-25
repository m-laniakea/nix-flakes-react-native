{ pkgs
,
}:

rec {
  androidHome = "${androidComposition.androidsdk}/libexec/android-sdk";
  androidRootSdk = "${androidComposition.androidsdk}/libexec/android-sdk";
  androidRootNdk = "${androidRootSdk}/ndk-bundle";
  aapt2Override = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidRootSdk}/build-tools/${buildToolsVersion}/aapt2";

  buildToolsVersion = "33.0.1";

  androidComposition = pkgs.androidenv.composeAndroidPackages {
    toolsVersion = "26.1.1";
    platformToolsVersion = "33.0.3";
    buildToolsVersions = [ "30.0.3" "${buildToolsVersion}" ];
    includeEmulator = true;
    emulatorVersion = "31.3.14";
    platformVersions = [ "33" ];
    includeSources = false;
    includeSystemImages = false;
    systemImageTypes = [ "google_apis_playstore" ];
    abiVersions = [ "armeabi-v7a" "arm64-v8a" ];
    cmakeVersions = [ "3.18.1" ];
    includeNDK = true;
    ndkVersions = ["22.1.7171670"];
    useGoogleAPIs = false;
    useGoogleTVAddOns = false;
    includeExtras = [
      "extras;google;gcm"
    ];
  };
}
