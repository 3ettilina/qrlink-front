import 'package:admin_panel/data/exceptions/get_product_resources_exception.dart';
import 'package:admin_panel/data/repository/add_product_repository.dart';
import 'package:admin_panel/domain/result/add_product_result.dart';

class AddProduct {
  static Future<AddProductResult> call({
    required String gtin,
    required bool onlyRedirect,
    required String name,
    required String resourceUrl,
  }) async {
    try {
      final isProductAdded = await AddProductRepository.call(
        gtin: gtin,
        onlyRedirect: onlyRedirect,
        name: name,
        resourceUrl: resourceUrl,
      );
      if (isProductAdded) {
        return AddProductResult(type: AddProductResultType.success);
      } else {
        return AddProductResult(type: AddProductResultType.error);
      }
    } on ProductNotFoundException catch (_) {
      return AddProductResult(type: AddProductResultType.gtinAlreadyExists);
    } on SomethingWentWrongException catch (_) {
      return AddProductResult(type: AddProductResultType.error);
    }
  }
}
