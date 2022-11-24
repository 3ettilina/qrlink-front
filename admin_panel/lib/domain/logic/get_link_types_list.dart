import 'package:admin_panel/data/exceptions/get_products_exception.dart';
import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/domain/repository/repository.dart';

class GetLinkTypeList {
  static Future<List<LinkType>> call() async {
    try {
      final response = await Repository.resourcesRepository.getLinkTypeList();
      final linkTypes = response
          .map((type) => LinkType(
              id: type.id, name: type.name, description: type.description))
          .toList();
      return linkTypes;
    } catch (e) {
      throw GetProductsGenericException();
    }
  }
}
