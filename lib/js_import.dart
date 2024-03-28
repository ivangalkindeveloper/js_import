//  Importing JS sources into Flutter Web projects.
//  Check README: https://github.com/ivangalkindeveloper/js_import/blob/master/README.md

library js_import;

export 'src/js_import_stub.dart'
    if (dart.library.js_interop) 'src/js_import_html.dart'; // dart:io implementation
