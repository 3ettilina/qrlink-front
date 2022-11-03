import 'dart:js' as js;

class OpenUrl {
  static byString(String urlToOpen) {
    js.context.callMethod('open', [urlToOpen, '_self']);
  }
}
