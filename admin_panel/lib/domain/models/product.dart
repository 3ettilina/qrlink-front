import 'package:admin_panel/data/exceptions/get_products_exception.dart';
import 'package:admin_panel/domain/models/models.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.gtin,
    required this.onlyRedirect,
    this.resources = const [],
  });

  final String gtin;
  final bool onlyRedirect;
  final List<Resource> resources;

  factory Product.toProduct(Map<String, dynamic> jsonProduct) {
    try {
      return Product(
          gtin: jsonProduct["gtin"],
          onlyRedirect: jsonProduct["only_redirect"],
          resources: Resource.toResourceList(jsonProduct["resources"]));
    } catch (e) {
      throw NotAbleToConvertToTypeException();
    }
  }

  @override
  List<Object?> get props => [gtin];
}
