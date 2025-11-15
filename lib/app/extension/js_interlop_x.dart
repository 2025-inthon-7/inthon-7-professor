import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:web/web.dart' as web;

extension JSObjectExtension on Map<String, dynamic> {
  JSObject jsify() {
    final jsObject = JSObject();
    forEach((key, value) {
      if (value is String) {
        jsObject.setProperty(key.toJS, value.toJS);
      } else if (value is num) {
        jsObject.setProperty(key.toJS, value.toJS);
      } else if (value is bool) {
        jsObject.setProperty(key.toJS, value.toJS);
      } else if (value is List<String>) {
        final jsArray = value.map((e) => e.toJS).toList().toJS;
        jsObject.setProperty(key.toJS, jsArray);
      } else if (value is Map<String, dynamic>) {
        jsObject.setProperty(key.toJS, value.jsify());
      }
    });
    return jsObject;
  }
}

// JS Interop extensions
extension type PIPWindow(JSObject _) implements JSObject {
  external web.Document get document;
  external void postMessage(JSAny? message, String targetOrigin);
  external bool get closed;
  external void close();
}
