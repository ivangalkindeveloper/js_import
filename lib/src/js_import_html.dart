import 'package:web/web.dart' as web;
import 'package:path/path.dart' as p;

class JSImport {
  static Future<void> import({
    required String source,
    String? package,
    bool defer = false,
    bool async = true,
  }) async {
    source = _packageUrl(source, package);
    if (isImported(source: source)) {
      return;
    }
    final web.Element head = _headElement();
    final web.HTMLScriptElement libraryElement = _scriptElement(
      source: source,
      defer: defer,
      async: async,
    );
    head.appendChild(libraryElement);
    await libraryElement.onLoad.first;
  }

  static bool isImported({
    required String source,
    String? package,
  }) {
    source = _packageUrl(source, package);
    final web.Element head = _headElement();
    return head.querySelector('[src\$="$source"]') != null;
  }

  static web.Element _headElement() {
    web.Element? head = web.document.querySelector("head");
    if (head == null) {
      throw StateError("Could not fetch html head element!");
    }

    return head;
  }

  static web.HTMLScriptElement _scriptElement({
    required String source,
    required bool defer,
    required bool async,
  }) =>
      web.HTMLScriptElement()
        ..type = "text/javascript"
        ..charset = "utf-8"
        ..defer = async
        ..async = async
        ..src = source;
}

String _packageUrl(String source, [String? package]) {
  if (package == null) {
    return source;
  }
  return p.normalize("assets/packages/$package/$source");
}
