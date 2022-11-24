class BackEndpoints {
  static String baseUrlDev = 'qrlink-dev.rj.r.appspot.com';
  static String languagesBaseUrl = 'localeplanet.com';

  static Uri getProductResources(String gtin) =>
      Uri.https(baseUrlDev, '/getProductResources', {'gtin': gtin});

  static Uri addResourceToProduct(String gtin) =>
      Uri.https(baseUrlDev, '/product/addResource', {'gtin': gtin});

  static Uri addProduct() => Uri.https(baseUrlDev, '/product/addProduct');

  static Uri getLinkTypes() => Uri.https(baseUrlDev, '/admin/getLinkTypeList');

  static Uri getProducts() => Uri.https(baseUrlDev, '/product/getProducts');

  static Uri getProductDetails(String gtin) =>
      Uri.https(baseUrlDev, '/admin/product', {'gtin': gtin});

  static Uri deleteProduct(String gtin) =>
      Uri.https(baseUrlDev, '/product/delete', {'gtin': gtin});

  static Uri deleteResource(String gtin) =>
      Uri.https(baseUrlDev, '/product/deleteResource', {'gtin': gtin});

  static Uri editResource(String gtin) =>
      Uri.https(baseUrlDev, '/product/editResource', {'gtin': gtin});

  static Uri setOnlyRedirect(
    String gtin,
  ) =>
      Uri.https(baseUrlDev, '/product/setOnlyRedirect', {'gtin': gtin});
}
