//  Importing JS sources into Flutter Web projects.
//  Check README: https://github.com/ivangalkindeveloper/js_import/blob/master/README.md

library js_import;

export 'src/js_import_html.dart'
    if (dart.library.io) 'src/js_import_io.dart'; // dart:io implementation
