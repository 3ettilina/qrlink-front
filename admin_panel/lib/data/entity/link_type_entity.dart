import 'package:admin_panel/data/exceptions/get_products_exception.dart';

class LinkTypeEntity {
  LinkTypeEntity({
    required this.id,
    required this.name,
    required this.description,
  });

  final String id;
  final String name;
  final String description;

  factory LinkTypeEntity.fromJson(Map<String, dynamic> json) {
    try {
      return LinkTypeEntity(
          id: json["id"], name: json["name"], description: "description");
    } catch (e) {
      throw NotAbleToConvertToTypeException();
    }
  }

  static List<LinkTypeEntity> toListFromJson(
    List<dynamic> jsonList,
  ) {
    return jsonList.map((json) => LinkTypeEntity.fromJson(json)).toList();
  }
}
