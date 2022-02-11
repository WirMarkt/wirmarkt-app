# WirMarkt App

Yay, we've built ourselves an app. It makes shopping, decision-making and collaboration much easier. And we make our impact visible!

Some features:

* Shopping: membership card, shopping list (planned), digital and anonymous receipt (planned).
* Decision-making: product suggestions, decision-making processes (planned).
* Collaboration: shift planning, training material (planned).
* Community: impact, events (planned), presentation of the suppliers (planned).

# Requirements

Set up Flutter development environment first [https://flutter.dev/].

# Launching on development machine

```bash

flutter clean
flutter run

```

# Seting up Android Studio

* install Flutter and Flutter Intl plugins
* restart
* open project
* you should be able to start simulator/emulator for iOS (macOS only) and Android (requires Android SDK)

# Building generated files 

`@JsonSerializable` annotations and handling of i18n files need the code generator to run from time to time.

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

You may as well run the code generator continuously using:


```bash
flutter pub run build_runner watch
```
