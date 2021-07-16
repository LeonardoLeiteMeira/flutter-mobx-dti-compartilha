# flutter_mobx_dti_compartilha

## Build Runner Commands
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

alternative
```bash
flutter packages pub run build_runner build
```

To application listen any changes in the code and run build runner, use this code
```dart
flutter pub run build_runner watch
```

If using vc code, there are a possibility to add the fluuter_mobx (from flutterando) extension.

If there are problems with generation, use the command:
```bash
flutter packages pub run build_runner clean
```