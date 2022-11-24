import 'package:admin_panel/data/exceptions/delete_resource_exception.dart';
import 'package:admin_panel/domain/models/resource.dart';
import 'package:admin_panel/domain/repository/repository.dart';

class DeleteResource {
  static Future<bool> call(String gtin, Resource resource) async {
    try {
      return await Repository.resourcesRepository.deleteResource(
        gtin: gtin,
        resourceName: resource.name,
        resourceLanguage: resource.language,
        resourceLink: resource.linkType,
        resourceUrl: resource.resourceUrl,
      );
    } catch (_) {
      throw DeleteResourceGenericException();
    }
  }
}
