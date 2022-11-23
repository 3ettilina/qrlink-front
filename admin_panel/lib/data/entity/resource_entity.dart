import 'package:admin_panel/domain/models/models.dart';

class ResourceEntity {
  ResourceEntity({
    required this.name,
    required this.linkType,
    required this.language,
    required this.resourceUrl,
  });

  final String name;
  final String? linkType;
  final String? language;
  final String resourceUrl;

  factory ResourceEntity.toResource(Map<String, dynamic> resourceJson) {
    return ResourceEntity(
      name: resourceJson["name"],
      linkType: resourceJson["link_type"],
      language: resourceJson["language"],
      resourceUrl: resourceJson["resource_url"],
    );
  }

  static Map<String, dynamic> toJson(ResourceEntity resource) {
    try {
      return <String, dynamic>{
        "name": resource.name,
        "link_type": resource.linkType,
        "language": resource.language,
        "resource_url": resource.resourceUrl,
      };
    } catch (e) {
      rethrow;
    }
  }

  static List<ResourceEntity> toResourceList(List<dynamic> resourcesJson) {
    return resourcesJson.map((res) => ResourceEntity.toResource(res)).toList();
  }
}
