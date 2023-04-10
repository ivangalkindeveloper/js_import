import 'package:js_import/js_import.dart';
import 'package:flutter/material.dart';
import 'package:js/js_util.dart' as js_util;

void main() {
  JSImport.import(
    sources: [
      "asset/app.js",
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("JS Import"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Is imported: ${JSImport.isImported(source: "asset/app.js")}",
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => js_util.callMethod(js_util.globalThis, 'alertMessage',
                    ['Flutter is calling upon JavaScript!']),
                child: Text(
                  "Alert",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
