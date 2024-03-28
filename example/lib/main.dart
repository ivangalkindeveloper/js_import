import 'package:js_import/js_import.dart';
import 'package:flutter/material.dart';
import 'package:js/js_util.dart' as js_util;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("JS Import"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ...buildPackageAssetJs(
              source: 'asset/app.js',
              method: 'alertMessage',
            ),
            const SizedBox(height: 48),
            const Divider(),
            const SizedBox(height: 48),
            ...buildPackageAssetJs(
              source: 'assets/app_package.js',
              package: 'example_package_with_js',
              method: 'alertMessagePackage',
            ),
            const SizedBox(height: 48),
            const Divider(),
            const SizedBox(height: 48),
            ...buildPackageAssetJs(
              source: 'lib/app_package.js',
              package: 'example_package_with_js',
              method: 'alertMessagePackageLib',
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildAssetJs() {
    const source = 'asset/app.js';
    return [
      ElevatedButton(
        onPressed: () {
          JSImport.import(source: source);
          assert(JSImport.isImported(source: source));
          setState(() {});
        },
        child: const Text('import $source'),
      ),
      const SizedBox(height: 16),
      Text(
        "Is imported: ${JSImport.isImported(source: source)}",
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        onPressed: () => js_util.callMethod(js_util.globalThis, 'alertMessage',
            ['Flutter is calling upon JavaScript!']),
        child: const Text(
          "Alert",
        ),
      ),
    ];
  }

  List<Widget> buildPackageAssetJs({
    required String source,
    String? package,
    required String method,
  }) {
    return [
      ElevatedButton(
        onPressed: () {
          JSImport.import(source: source, package: package);
          assert(JSImport.isImported(source: source, package: package));
          setState(() {});
        },
        child: Text('import $source in ${package ?? 'this'}'),
      ),
      const SizedBox(height: 16),
      Text(
        "Is imported: ${JSImport.isImported(source: source)}",
      ),
      const SizedBox(height: 16),
      ElevatedButton(
        onPressed: () {
          return js_util.callMethod(js_util.globalThis, method, [
            'Flutter is calling js in $source in package: ${package ?? 'this'}!'
          ]);
        },
        child: const Text(
          "Alert",
        ),
      ),
    ];
  }
}
