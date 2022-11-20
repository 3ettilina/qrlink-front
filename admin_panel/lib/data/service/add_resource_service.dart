import 'package:admin_panel/data/endpoints.dart';
import 'package:admin_panel/data/exceptions/get_product_resources_exception.dart';
import 'package:admin_panel/data/service/client.dart';
import 'package:dio/dio.dart';

class AddResourceService {
  Future<bool> call(String gtin, Map<String, dynamic> resource) async {
    try {
      final response = await RestServiceClient.post(
        uri: BackEndpoints.addResourceToProduct(gtin),
        data: resource,
      );

      return response.statusCode == 200;
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        throw ProductNotFoundException(gtin);
      } else {
        throw SomethingWentWrongException(gtin);
      }
    } catch (e) {
      throw SomethingWentWrongException(gtin);
    }
  }
}
