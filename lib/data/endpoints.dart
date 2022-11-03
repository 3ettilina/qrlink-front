class Endpoints {
  static String baseUrlDev = 'qrlink-dev.rj.r.appspot.com';
  static String baseWebUrlDev = 'https://qrlink-dev.web.app/';

  static Uri getProductDev(String gtin) =>
      Uri.https(baseUrlDev, '/getProduct', {'productId': gtin});

  static Uri getProductDetailsAdminDev(String gtin) =>
      Uri.https(baseUrlDev, '/admin/product', {'gtin': gtin});

  static String webGetProductDetails(String gtin) =>
      '$baseWebUrlDev/?gtin=$gtin';
}
