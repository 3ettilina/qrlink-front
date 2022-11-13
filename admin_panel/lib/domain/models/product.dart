import 'package:admin_panel/domain/models/models.dart';

class Product {
  Product({
    required this.gtin,
    required this.name,
    required this.resourceUrl,
    this.resources = const [],
  });

  final String gtin;
  final String name;
  final String resourceUrl;
  final List<Resource> resources;

  factory Product.toProduct(Map<String, dynamic> jsonProduct) {
    try {
      return Product(
          gtin: jsonProduct["gtin"],
          name: jsonProduct["name"],
          resourceUrl: jsonProduct["resource_url"],
          resources: Resource.toResourceList(jsonProduct["resources"]));
    } catch (e) {
      rethrow;
    }
  }
}
