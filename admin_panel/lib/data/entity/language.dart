import 'package:admin_panel/data/exceptions/generic_exception.dart';

class LanguageEntity {
  const LanguageEntity({required this.code, required this.name});

  final String code;
  final String name;

  static List<LanguageEntity> fromJsonToList(String json) {
    try {
      final list = json.replaceAll(RegExp('(["]|[{-}])+'), '').split(',');
      final listOfLangs = list.map<LanguageEntity>((e) {
        final langMap = e.split(':'); // 2 values: code & name
        return LanguageEntity(code: langMap.first, name: langMap.last);
      }).toList();
      return listOfLangs;
    } catch (e) {
      throw GenericException();
    }
  }
}
