import 'package:admin_panel/data/repository/products_repository.dart';
import 'package:admin_panel/data/repository/resources_repository.dart';

class Repository {
  static final productsRepository = ProductsRepository();
  static final resourcesRepository = ResourcesRepository();
}
