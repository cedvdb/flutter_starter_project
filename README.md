# eureka_app

A starter flutter project with common features I use.

## Content

  - easy_localization
  - google_fonts
  - firebase
  - font_awesome
  - rxdart
  - spinkit

## Firebase setup

### Create firebase project

Create an android project. When creating the project you must specify a package name.

The "Android package name" must match your local project's package name that was created when you started the Flutter project. The current package name can be found in your module (app-level) Gradle file, usually android/app/build.gradle, defaultConfig section (example package name: com.yourcompany.yourproject).

When creating a new Android app "debug signing certificate SHA-1" is optional, however, it is required for Dynamic Links & Phone Authentication. To generate a certificate run cd android && ./gradlew signingReport and copy the SHA1 from the debug key. This generates two variant keys. You can copy the 'SHA1' that belongs to the debugAndroidTest variant key option.