import 'package:admin_panel/data/exceptions/get_products_exception.dart';
import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/domain/repository/repository.dart';

class GetProductDetails {
  static Future<Product?> call(String gtin) async {
    try {
      final response =
          await Repository.productsRepository.getProductDetails(gtin);
      final product = Product(
          gtin: response.gtin,
          onlyRedirect: response.onlyRedirect,
          resources: response.resources
              .map((r) => Resource(
                    name: r.name,
                    linkType: r.linkType,
                    language: r.language,
                    resourceUrl: r.resourceUrl,
                  ))
              .toList());
      return product;
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }
}
