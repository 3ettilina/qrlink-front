import 'package:admin_panel/data/exceptions/delete_product_exception.dart';
import 'package:admin_panel/domain/repository/repository.dart';

class DeleteProduct {
  static Future<bool> call(String gtin) async {
    try {
      return await Repository.productsRepository.deleteProduct(gtin);
    } catch (_) {
      throw DeleteProductGenericException();
    }
  }
}
