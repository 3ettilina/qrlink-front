import 'package:admin_panel/data/exceptions/generic_exception.dart';
import 'package:admin_panel/domain/repository/repository.dart';

class EditResource {
  static Future<bool> call({
    required String gtin,
    required String resourceName,
    required String? resourceLink,
    required String? resourceLanguage,
    required String resourceUrl,
  }) async {
    try {
      final isResourceEdited =
          await Repository.resourcesRepository.editResource(
        gtin: gtin,
        resourceName: resourceName,
        resourceLink: resourceLink,
        resourceLanguage: resourceLanguage ?? '',
        resourceUrl: resourceUrl,
      );
      return isResourceEdited;
    } catch (e) {
      throw GenericException();
    }
  }
}
