import 'package:admin_panel/data/endpoints.dart';
import 'package:admin_panel/data/exceptions/add_product_exception.dart';
import 'package:dio/dio.dart';

class AddProductRepository {
  static Future<bool> call({
    required String gtin,
    required bool onlyRedirect,
    required String name,
    required String resourceUrl,
  }) async {
    final client = Dio();

    try {
      var response = await client.postUri(BackEndpoints.addProduct(),
          data: {
            "gtin": gtin,
            "only_redirect": onlyRedirect,
            "resources": [
              {
                "name": name,
                "resource_url": resourceUrl,
              }
            ]
          },
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
        throw GtinAlreadyExistsException(gtin);
      } else {
        throw SomethingWentWrongException(gtin);
      }
    } catch (e) {
      throw SomethingWentWrongException(gtin);
    }
  }
}
