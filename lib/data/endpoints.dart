import 'dart:html';

class BackEndpoints {
  static String baseUrlDev = 'qrlink-dev.rj.r.appspot.com';

  static Uri getProductResources(String gtin) =>
      Uri.https(baseUrlDev, '/getProductResources', {'gtin': gtin});
}

class WebUrls {
  static String baseWebUrlDev() => window.location.href.split('/#/')[0];
  static String webGetProductDetails(String gtin) =>
      '${baseWebUrlDev()}/?gtin=$gtin';
}
