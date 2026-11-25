# PassNote

> **Prototype sample only — not a functional password manager.**
>
> Do not enter, copy, or store real passwords or other sensitive information in this app. The sign-in screen accepts any input, and the sample credentials and generated keys are demonstration content only.

PassNote is a static Flutter UI prototype for an offline-first password manager concept. It demonstrates a retro monospace sign-in screen, dashboard, credential vault, key generator preview, and profile/security settings.

## What works in this prototype

- Navigate between the five sample screens.
- Search and filter the sample credential entries, reveal their placeholder passwords, and copy sample text.
- Adjust the key-length slider and character-set toggles, and cycle through fixed example keys.
- Toggle the profile settings for demonstration.

These are UI interactions only. This app does **not** implement authentication, encryption, a hardware keystore, persistent vault storage, real password generation or strength auditing, or a backend/API. Displayed security status and metrics are illustrative and do not reflect actual security checks.

## APK download

Download the sample ARM64 APK from the [PassNote v1.0.0 GitHub release](https://github.com/Kommiiii/PassNote-UI-Prototype/releases/tag/v1.0.0). Installing the APK does not make the prototype a working password manager.

## Run

```bash
flutter pub get
flutter run -d web-server
```

Open the local URL printed by Flutter in a browser. To run on an Android device, connect the device with USB debugging enabled and run `flutter run`.

## Build an Android APK

```bash
flutter build apk --release
```

The APK is written to `build/app/outputs/flutter-apk/app-release.apk`.

## Validate

```bash
flutter analyze
flutter test
```
