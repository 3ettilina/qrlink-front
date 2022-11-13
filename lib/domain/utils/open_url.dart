import 'dart:js' as js;

import 'package:qrlink/data/endpoints.dart';

class OpenUrl {
  static byString(String urlToOpen) {
    js.context.callMethod('open', [urlToOpen, '_self']);
  }

  static blankByString(String urlToOpen) {
    js.context.callMethod('open', [urlToOpen]);
  }

  static openWebDevUrl(String text) {
    OpenUrl.byString(WebUrls.webGetProductDetails(text));
  }
}
