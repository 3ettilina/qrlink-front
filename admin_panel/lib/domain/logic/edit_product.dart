import 'package:admin_panel/data/exceptions/generic_exception.dart';
import 'package:admin_panel/domain/repository/repository.dart';

class EditProduct {
  static Future<bool> call({
    required String gtin,
    bool? isOnlyRedirect,
    required String resourceName,
    String? resourceUrl,
  }) async {
    try {
      final isProductEdited = await Repository.productsRepository.editProduct(
        gtin: gtin,
        isOnlyRedirect: isOnlyRedirect,
        name: resourceName,
        resourceUrl: resourceUrl,
      );
      return isProductEdited;
    } catch (e) {
      throw GenericException();
    }
  }
}
