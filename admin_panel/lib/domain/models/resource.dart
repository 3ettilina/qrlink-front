import 'package:equatable/equatable.dart';

class Resource extends Equatable {
  const Resource({
    required this.name,
    required this.linkType,
    required this.language,
    required this.resourceUrl,
  });

  final String name;
  final String? linkType;
  final String? language;
  final String resourceUrl;

  factory Resource.builder({
    String name = '',
    String? language,
    String? linkType,
    String resourceUrl = '',
  }) =>
      Resource(
          name: name,
          linkType: linkType,
          language: language,
          resourceUrl: resourceUrl);

  factory Resource.toResource(Map<String, dynamic> resourceJson) {
    return Resource(
      name: resourceJson["name"],
      linkType: resourceJson["link_type"],
      language: resourceJson["language"],
      resourceUrl: resourceJson["resource_url"],
    );
  }

  static Map<String, dynamic> fromResourceToJson(Resource resource) {
    try {
      return {
        "name": resource.name,
        "link_type": resource.linkType,
        "language": resource.language,
        "resource_url": resource.resourceUrl,
      };
    } catch (e) {
      rethrow;
    }
  }

  static Map<String, dynamic> toJson({
    required String name,
    String? linkType,
    String? language,
    required String url,
  }) {
    try {
      return <String, dynamic>{
        "name": name,
        "link_type": linkType,
        "language": language,
        "resource_url": url,
      };
    } catch (e) {
      rethrow;
    }
  }

  static List<Resource> toResourceList(List<dynamic> resourcesJson) {
    return resourcesJson.map((res) => Resource.toResource(res)).toList();
  }

  @override
  List<Object?> get props => [name, linkType, language, resourceUrl];
}
