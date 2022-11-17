import 'package:admin_panel/domain/models/models.dart';

class Product {
  Product({
    required this.gtin,
    required this.onlyRedirect,
    this.resources = const [],
  });

  final String gtin;
  final String onlyRedirect;
  final List<Resource> resources;

  factory Product.toProduct(Map<String, dynamic> jsonProduct) {
    try {
      return Product(
          gtin: jsonProduct["gtin"],
          onlyRedirect: jsonProduct["only_redirect"],
          resources: Resource.toResourceList(jsonProduct["resources"]));
    } catch (e) {
      rethrow;
    }
  }
}
