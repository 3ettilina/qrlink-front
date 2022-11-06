import 'dart:html';

class BackEndpoints {
  static String baseUrlDev = 'qrlink-dev.rj.r.appspot.com';

  /// Returns something like
  /// ```
  /// {
  ///  "gtin": "9506000134352",
  ///  "name": Champiñón salvaje,
  ///  "resource_url": "https://dalgiardino.com/mushroom-squash-risotto/",
  ///  "resources": [
  ///      {
  ///          "name": "Receta con champiñón salvaje",
  ///          "link_type": "gs1:recipeInfo",
  ///          "language": "es",
  ///          "resource_url": "https://dalgiardino.com/mushroom-squash-risotto/"
  ///      },
  ///      {
  ///          "name": "Receta con champiñón salvaje",
  ///          "link_type": "gs1:recipeInfo",
  ///          "language": "es",
  ///          "resource_url": "https://dalgiardino.com/mushroom-squash-risotto/"
  ///      }
  ///  ]
  /// }
  /// ```
  static Uri getProductResources(String gtin) =>
      Uri.https(baseUrlDev, '/getProductResources', {'gtin': gtin});
}

class WebUrls {
  static String baseWebUrlDev() => window.location.href.split('/#/')[0];
  static String webGetProductDetails(String gtin) =>
      '${baseWebUrlDev()}/?gtin=$gtin';
}
