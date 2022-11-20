import 'package:admin_panel/data/endpoints.dart';
import 'package:admin_panel/data/exceptions/add_product_exception.dart';
import 'package:admin_panel/data/service/client.dart';
import 'package:dio/dio.dart';

class AddProductService {
  Future<bool> call({
    required String gtin,
    required bool onlyRedirect,
    required String name,
    required String resourceUrl,
  }) async {
    try {
      final response = await RestServiceClient.post(
        uri: BackEndpoints.addProduct(),
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
      );

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
