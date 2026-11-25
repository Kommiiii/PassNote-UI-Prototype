# PassNote

PassNote is a static Flutter UI prototype for an offline-first password manager concept. It includes a retro monospace sign-in screen, dashboard, credential vault, key generator preview, and profile/security settings.

The app uses sample data only. It does not implement authentication, encryption, persistent storage, a backend, or real password generation.

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
