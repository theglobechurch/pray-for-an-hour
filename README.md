# Pray for an Hour

## Description

When suggesting the idea of praying for an hour many Christian's will look slightly scared… _"I haven't managed to pray more than five minutes, a whole hour sounds impossible"_.

Pray for an Hour is modeled on [The Hour that Changes the World](https://goo.gl/37MceU), breaking up the hour into five minute chunks.

## Roadmap

The roadmap for Pray for an Hour is [on Trello](https://trello.com/b/vitsxzO3).

## Development

It is built using [Dart](https://www.dartlang.org/) + [Flutter](https://flutter.io/). To get started refer to the [Getting Started](https://flutter.io/docs/get-started/install) step-by-step on the Flutter website.

## Deployment build

### [Android](https://flutter.io/docs/deployment/android)

Ensure you have a keystore file

Create a `.key.properties` file under `android` with

```
storePassword=<password from previous step>
keyPassword=<password from previous step>
keyAlias=key
storeFile=<eg: /Users/<user name>/key.jks>
```

Build the APK: `flutter build apk`

Release to a test device: `flutter install`

## Other notes

This was built partly as an experiment to learn how to write Dart/Flutter… There is a lot to learn…
