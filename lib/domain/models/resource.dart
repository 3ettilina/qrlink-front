class Resource {
  Resource({
    required this.name,
    required this.linkType,
    required this.language,
    required this.resourceUrl,
  });

  final String name;
  final String linkType;
  final String? language;
  final String resourceUrl;

  factory Resource.toResource(Map<String, dynamic> resourceJson) {
    return Resource(
      name: resourceJson["name"],
      linkType: resourceJson["link_type"],
      language: resourceJson["language"],
      resourceUrl: resourceJson["resource_url"],
    );
  }

  static List<Resource> toResourceList(List<dynamic> resourcesJson) {
    return resourcesJson.map((res) => Resource.toResource(res)).toList();
  }
}
