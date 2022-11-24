import 'package:admin_panel/data/entity/language.dart';
import 'package:admin_panel/data/entity/link_type_entity.dart';
import 'package:admin_panel/data/entity/resource_entity.dart';
import 'package:admin_panel/data/service/resources_service.dart';

class ResourcesRepository {
  ResourcesRepository({
    ResourceService? resourceService,
  }) : _resourceService = resourceService ?? ResourceService();

  final ResourceService _resourceService;

  Future<bool> addResourceToProduct({
    required String gtin,
    required String resourceName,
    required String? resourceLinkType,
    required String? resourceLanguage,
    required String resourceUrl,
  }) async {
    final resource = ResourceEntity(
      name: resourceName,
      linkType: resourceLinkType,
      language: resourceLanguage,
      resourceUrl: resourceUrl,
    );
    final resourceJson = ResourceEntity.toJson(resource);
    return _resourceService.add(gtin, resourceJson);
  }

  Future<bool> deleteResource({
    required String gtin,
    required String resourceName,
    String? resourceLink,
    String? resourceLanguage,
    required String resourceUrl,
  }) async {
    assert(resourceLink != null || resourceLanguage != null);
    final resource = ResourceEntity(
        name: resourceName,
        linkType: resourceLink,
        language: resourceLanguage,
        resourceUrl: resourceUrl);
    final result = await _resourceService.delete(gtin, resource);
    return result;
  }

  Future<bool> editResource({
    required String gtin,
    required String resourceName,
    String? resourceLink,
    String? resourceLanguage,
    required String resourceUrl,
  }) async {
    assert(resourceLink != null || resourceLanguage != null);
    final resource = ResourceEntity(
        name: resourceName,
        linkType: resourceLink,
        language: resourceLanguage,
        resourceUrl: resourceUrl);
    final result = await _resourceService.delete(gtin, resource);
    return result;
  }

  Future<List<LinkTypeEntity>> getLinkTypeList() async {
    final result = await _resourceService.getLinkTypeList();
    return result;
  }

  Future<List<LanguageEntity>> getBrowserLanguages() async {
    final result = await _resourceService.getLanguages();
    return result;
  }
}
