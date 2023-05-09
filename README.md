# JS Import
Importing JS sources into Flutter Web projects.

<div align="center">

  <a href="">![Pub Likes](https://img.shields.io/pub/likes/js_import?color=success)</a>
  <a href="">![Pub Version](https://img.shields.io/pub/v/js_import?color=important)</a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>

</div>

<div align="center">
  <a href="https://www.buymeacoffee.com/ivangalkin" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="32px" width= "128px"></a>
</div>

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

## Additional Information
For more details see example project.\
And feel free to open an issue if you find any bugs or errors or suggestions.