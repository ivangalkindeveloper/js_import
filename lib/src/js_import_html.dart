import 'dart:html' as html;

/// Importing JS sources into Flutter Web projects.
class JSImport {
  static Future<void> import({
    required List<String> sources,
    bool defer = false,
    bool async = true,
  }) {
    final List<Future<void>> futures = <Future<void>>[];
    final html.Element head = _headElement();

    for (String source in sources) {
      if (isImported(source: source) == false) {
        final html.ScriptElement libraryElement = _scriptElement(
          source: source,
          defer: defer,
          async: async,
        );
        head.children.add(libraryElement);
        futures.add(libraryElement.onLoad.first);
      }
    }

    return Future.wait(futures);
  }

  static bool isImported({
    required String source,
  }) {
    final html.Element head = _headElement();
    final List<html.Element> elements = head.children;

    for (html.Element element in elements) {
      if (element is html.ScriptElement && element.src.endsWith(source)) {
        return true;
      }
    }

    return false;
  }

  static html.Element _headElement() {
    html.Element? head = html.querySelector("head");
    if (head == null) {
      throw StateError("Could not fetch html head element!");
    }

    return head;
  }

  static html.ScriptElement _scriptElement({
    required String source,
    required bool defer,
    required bool async,
  }) =>
      html.ScriptElement()
        ..type = "text/javascript"
        ..charset = "utf-8"
        ..defer = async
        ..async = async
        ..src = source;
}
