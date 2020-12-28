import 'dart:developer' as dev;

extension StringLog on String {
  String log({String str}) {
    dev.log("[${DateTime.now()}] [$str] $this", name: "APP");
    return this;
  }
}
