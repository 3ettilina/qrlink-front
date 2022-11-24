import 'package:admin_panel/data/exceptions/get_product_resources_exception.dart';
import 'package:admin_panel/domain/repository/repository.dart';
import 'package:admin_panel/domain/result/add_resource_result.dart';

class AddResourceToProduct {
  static Future<AddResourceResult> call({
    required String gtin,
    required String resourceName,
    required String? resourceLinkType,
    required String? resourceLanguage,
    required String resourceUrl,
  }) async {
    try {
      final isResourseAdded =
          await Repository.resourcesRepository.addResourceToProduct(
        gtin: gtin,
        resourceName: resourceName,
        resourceLinkType: resourceLinkType,
        resourceLanguage: resourceLanguage,
        resourceUrl: resourceUrl,
      );
      if (isResourseAdded) {
        return AddResourceResult(type: AddResourceResultType.success);
      } else {
        return AddResourceResult(type: AddResourceResultType.error);
      }
    } on ProductNotFoundException catch (_) {
      return AddResourceResult(type: AddResourceResultType.alreadyExist);
    } on SomethingWentWrongException catch (_) {
      return AddResourceResult(type: AddResourceResultType.error);
    }
  }
}
