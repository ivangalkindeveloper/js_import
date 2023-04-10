# JS Import
/// Importing JS sources into Flutter Web projects.

## Getting Started
Import:
```dart
  JSImport.import(
    sources: [
      "asset/app.js",
      "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js",
    ],
  );
```

Is imported:
```dart
  JSImport.isImported(source: "asset/app.js");
```

