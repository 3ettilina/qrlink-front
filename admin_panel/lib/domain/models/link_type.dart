import 'package:admin_panel/data/exceptions/get_products_exception.dart';
import 'package:equatable/equatable.dart';

class LinkType extends Equatable {
  const LinkType({
    required this.id,
    required this.name,
    required this.description,
  });

  final String id;
  final String name;
  final String description;

  factory LinkType.fromJson(Map<String, dynamic> json) {
    try {
      return LinkType(
          id: json["id"], name: json["name"], description: "description");
    } catch (e) {
      throw NotAbleToConvertToTypeException();
    }
  }

  static List<LinkType> toListFromJson(
    List<dynamic> jsonList,
  ) {
    return jsonList.map((json) => LinkType.fromJson(json)).toList();
  }

  @override
  List<Object?> get props => [id];
}
