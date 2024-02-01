# ToDo
This is a To-Do list app that is listed chronologically and has the ability to mark items as completed. Each item can also be deleted from the list if required. This was built using [Flutter](https://flutter.dev/), an open-source UI software development kit created by Google. It is used to develop cross platform applications from a single codebase for any web browser, Fuchsia, Android, iOS, Linux, macOS, and Windows devices.

## Demo
https://github.com/omcodedthis/ToDo/assets/119602009/e94a9283-850a-42d9-87f2-191b13d96fac

The above demo shows the addition & removal of items in the ToDo app. ToDo is then closed & re-opened, with the items still present, showcasing the persistence of the app. ToDo is _modular_, allowing you to add more data parameters easily by mainly only editing the `ToDo` class.

## Future Updates
- [ ] Improve the aesthetics of the app.
- [ ] Add more input points for each item in the list such as date & etc.
- [X] Remove the ephemeral state of the app using a SQL database.
- [X] Add support for Windows & web browsers.
- [X] Each item is unique regardless of its name.

## Getting Started
- Download [Android Studio](https://developer.android.com/studio).
- Run these commands (to generate a `.apk` file):
  
  ```
  flutter clean # cleans the files.
  ```
  ```
  flutter build apk # builds the apk file.
  ```
  The apk file should be created in the `build/app/outputs/flutter-apk` directory.
- Use [this](https://stackoverflow.com/questions/9718104/how-to-install-apk-from-pc) to install the `.apk` file onto your Android device.
  
- Since Flutter supports multiple platforms from a single codebase, ToDo is also available as a Web App & as a Desktop App.

###  _Note: Work in Progress._

