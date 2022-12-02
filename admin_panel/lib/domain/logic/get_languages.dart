import 'package:admin_panel/data/exceptions/get_products_exception.dart';
import 'package:admin_panel/domain/models/language.dart';
import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/domain/repository/repository.dart';

class GetLanguages {
  static Future<List<Language>> call() async {
    try {
      final response =
          await Repository.resourcesRepository.getBrowserLanguages();
      final languages = response
          .map((lang) => Language(code: lang.code, name: lang.name))
          .toList();
      return languages;
    } catch (e) {
      throw GetProductsGenericException();
    }
  }
}
