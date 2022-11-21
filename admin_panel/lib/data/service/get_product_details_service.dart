import 'package:admin_panel/data/endpoints.dart';
import 'package:admin_panel/data/exceptions/get_product_details_exception.dart';
import 'package:admin_panel/data/service/client.dart';

class GetProductDetailsService {
  Future<Map<String, dynamic>> call(String gtin) async {
    try {
      final response = await RestServiceClient.get(
          uri: BackEndpoints.getProductDetails(gtin));
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
