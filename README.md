# react-native via nix flakes
Want to simplify your android dev environment setup? *A little bit of flakes is all it takes*.

## Getting started:
Make sure you have `nix` with [nix flakes enabled](https://nixos.wiki/wiki/Flakes#Enable_flakes).
```bash
nix develop                  # set up the dev environment. First time may take a while

cd <project-dir>             # you can use `reactNativeExample` for now
npm install                  # download required node_modules
react-native start           # allows you to run the app on your (emulated) device
```

#### Android build:
Multiple ways:
```bash
buildAndroidDebug            # builds debug android apk (alias of `react-native build-android`)
```
```bash
react-native build-android --no-packager
```
```bash
cd android
./gradlew clean              # optional
./gradlew build
```
#### iOS build:
```bash
# TODO
```

#### Creating a new project:
```bash
# There's an issue with `init` in the pinned `react-native-cli`, so init via `npx` for now
npx react-native init <newProjectName> 
# Then run or build as above
```

### TODO:
- Build iOS app
- Test on `ARM` and `darwin` systems
- Get `nix build` working
