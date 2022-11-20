class BackEndpoints {
  static String baseUrlDev = 'qrlink-dev.rj.r.appspot.com';

  static Uri getProductResources(String gtin) =>
      Uri.https(baseUrlDev, '/getProductResources', {'gtin': gtin});

  static Uri addResourceToProduct(String gtin) =>
      Uri.https(baseUrlDev, '/product/addResource', {'gtin': gtin});

  static Uri addProduct() => Uri.https(baseUrlDev, '/product/addProduct');

  static Uri getProducts() => Uri.https(baseUrlDev, '/product/getProducts');

  static Uri getProductDetails(String gtin) =>
      Uri.https(baseUrlDev, '/admin/product', {'gtin': gtin});
}
