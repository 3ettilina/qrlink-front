import 'package:admin_panel/data/exceptions/get_product_resources_exception.dart';
import 'package:admin_panel/data/repository/add_resource_repository.dart';
import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/domain/result/add_resource_result.dart';

class AddResourceToProduct {
  static Future<AddResourceResult> call({
    required String gtin,
    required String resourceName,
    required String resourceLinkType,
    required String resourceLanguage,
    required String resourceUrl,
  }) async {
    final resourceJson = Resource.toJson(
      name: resourceName,
      linkType: resourceLinkType,
      language: resourceLanguage,
      url: resourceUrl,
    );
    try {
      final isResourseAdded =
          await AddResourceRepository.call(gtin, resourceJson);
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
