class JSImport {
  static Future<void> import({
    required String source,
    String? package,
    bool defer = false,
    bool async = true,
  }) =>
      throw UnsupportedError(
        "JS import is only possible if the platform supports dart:hmtl!",
      );

  static bool isImported({
    required String source,
    String? package,
  }) =>
      throw UnsupportedError(
        "JS import is only possible if the platform supports dart:hmtl!",
      );
}
