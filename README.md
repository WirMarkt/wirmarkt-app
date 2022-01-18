# WirMarkt App

# Requirements

Set up Flutter development environment first.

# Launch on development machine

```bash

flutter clean
flutter run

```

# Set up IntelliJ / Android Studio

* install Flutter and Flutter Intl plugins
* restart
* open project
* you should be able to start simulator/emulator for iOS (macOS only) and Android (requires Android SDK)

# Building generated files 

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```