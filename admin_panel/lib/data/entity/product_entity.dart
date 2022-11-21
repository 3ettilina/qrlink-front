import 'package:admin_panel/data/entity/resource_entity.dart';
import 'package:admin_panel/data/exceptions/get_products_exception.dart';

class ProductEntity {
  ProductEntity({
    required this.gtin,
    required this.onlyRedirect,
    this.resources = const [],
  });

  final String gtin;
  final bool onlyRedirect;
  final List<ResourceEntity> resources;

  factory ProductEntity.fromJson(Map<String, dynamic> jsonProduct) {
    try {
      return ProductEntity(
          gtin: jsonProduct["gtin"],
          onlyRedirect: jsonProduct["only_redirect"],
          resources: ResourceEntity.toResourceList(jsonProduct["resources"]));
    } catch (e) {
      throw NotAbleToConvertToTypeException();
    }
  }

  static List<ProductEntity> toListFromJson(
    List<dynamic> productsJson,
  ) {
    return productsJson.map((json) => ProductEntity.fromJson(json)).toList();
  }
}
