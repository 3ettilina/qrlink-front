import 'package:admin_panel/data/exceptions/get_products_exception.dart';
import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/domain/repository/repository.dart';

class GetProductsList {
  static Future<List<Product>> call() async {
    try {
      final response = await Repository.productsRepository.getProductList();
      final products = response
          .map((p) => Product(
              gtin: p.gtin,
              onlyRedirect: p.onlyRedirect,
              resources: p.resources
                  .map((r) => Resource(
                        name: r.name,
                        linkType: r.linkType,
                        language: r.language,
                        resourceUrl: r.resourceUrl,
                      ))
                  .toList()))
          .toList();
      return products;
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }
}
