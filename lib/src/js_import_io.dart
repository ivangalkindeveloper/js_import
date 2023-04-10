/// Import JS libraries
class JSImport {
  static Future<void> import({
    required List<String> sources,
    bool defer = false,
    bool async = true,
  }) =>
      throw UnsupportedError(
        "JS import is only possible if the platform supports dart:hmtl!",
      );

  static bool isImported({
    required String source,
  }) =>
      throw UnsupportedError(
        "JS import is only possible if the platform supports dart:hmtl!",
      );
}
