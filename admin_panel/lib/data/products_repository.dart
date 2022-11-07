import 'package:admin_panel/data/endpoints.dart';
import 'package:admin_panel/data/exceptions.dart';
import 'package:dio/dio.dart';

class ProductsRepository {
  static Future<bool> addResourceToProduct(
      String gtin, Map<String, dynamic> resource) async {
    final client = Dio();

    try {
      var response =
          await client.postUri(BackEndpoints.addResourceToProduct(gtin),
              data: resource,
              options: Options(
                validateStatus: (status) => status == 200,
                headers: {
                  "Content-Type": "application/json",
                  "Accept": "application/json",
                },
              ));

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
