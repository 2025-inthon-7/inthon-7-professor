import 'dart:developer';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:web/web.dart' as web;

// JS Interop extensions
extension type PIPWindow(JSObject _) implements JSObject {
  external web.Document get document;
  external void postMessage(JSAny? message, String targetOrigin);
  external bool get closed;
  external void close();
}
