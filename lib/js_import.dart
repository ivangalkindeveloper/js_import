/// Importing JS sources into Flutter Web projects.
library js_import_inject;

export 'src/js_import_html.dart'
    if (dart.library.io) 'src/js_import_io.dart' // dart:io implementation
    if (dart.library.html) 'src/js_import_html.dart'; // dart:html implementation
