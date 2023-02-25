# react-native via nix flakes
Want to simplify your android dev environment setup? *A little bit of flakes is all it takes*.

## Getting started:
Make sure you have `nix` with [nix flakes enabled](https://nixos.wiki/wiki/Flakes#Enable_flakes).
```bash
nix develop                  # set up the dev environment. First time may take a while
```

#### Creating a new project:
```bash
npx react-native init <newProjectName>
```
> There's an issue with `init` in the pinned `react-native-cli`, so init via `npx` for now

```bash
cd <project-dir>
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

### TODO:
- Build iOS app
- Test on `ARM` and `darwin` systems
- Get `nix build` working
