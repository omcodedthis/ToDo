# ToDo
This is a To-Do list app that is listed chronologically and has the ability to mark items as completed. Each item can also be deleted from the list if required. This is built using [Flutter](https://flutter.dev/), an open-source UI software development kit created by Google. It is used to develop cross platform applications from a single codebase for any web browser, Fuchsia, Android, iOS, Linux, macOS, and Windows devices.

## Demo
https://github.com/omcodedthis/ToDo/assets/119602009/e94a9283-850a-42d9-87f2-191b13d96fac

The above demo shows the addition & removal of items in the ToDo app. ToDo is then closed & re-opened, with the items still present, to demonstrate the persistence of the app. ToDo is _modular_, allowing you to add more data parameters easily by mainly editing the `ToDo` class.

ToDo uses a [hive](https://pub.dev/packages/hive) database to store the each item in the ToDo list. For the sake of modularity, `database.dart` also handles the addition & removal of each ToDo in the list.

## Future Updates
- [X] Add more input points for each item, such as *date* & etc.
- [X] Improve the aesthetics of the app.
- [X] Remove the ephemeral state of the app using a SQL database.
- [X] Add support for Windows & web browsers.
- [X] Each item is unique regardless of its name.

## Getting Started
- Download [Android Studio](https://developer.android.com/studio).
- Since Flutter supports multiple platforms from a single codebase, ToDo is also available as a Web App & as a Desktop App.
- Run these commands (to generate an `.apk` file):
  
  ```
  flutter clean # cleans the files.
  ```
  ```
  flutter build apk # builds the apk file.
  ```
  The apk file should be created in the `build/app/outputs/flutter-apk` directory.
  - Use this command to install it on your Android device:
    
    ```
    adb install path_to_apk -t
    ```
