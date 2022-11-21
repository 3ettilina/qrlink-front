import 'package:admin_panel/data/endpoints.dart';
import 'package:admin_panel/data/exceptions/get_products_exception.dart';
import 'package:admin_panel/data/service/client.dart';

class GetProductsService {
  Future<List<dynamic>> call() async {
    try {
      final response =
          await RestServiceClient.get(uri: BackEndpoints.getProducts());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw SomethingWentWrongException();
      }
    } catch (e) {
      throw SomethingWentWrongException();
    }
  }
}
