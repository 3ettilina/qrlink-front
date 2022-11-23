import 'package:admin_panel/data/endpoints.dart';
import 'package:admin_panel/data/exceptions/add_product_exception.dart';
import 'package:admin_panel/data/exceptions/delete_product_exception.dart';
import 'package:admin_panel/data/exceptions/get_product_details_exception.dart';
import 'package:admin_panel/data/exceptions/get_products_exception.dart';
import 'package:admin_panel/data/service/client.dart';
import 'package:dio/dio.dart';

class ProductsService {
  Future<List<dynamic>> getProductsList() async {
    try {
      final response =
          await RestServiceClient.get(uri: BackEndpoints.getProducts());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw GetProductsGenericException();
      }
    } catch (e) {
      throw GetProductsGenericException();
    }
  }

  Future<Map<String, dynamic>> getProductDetails(String gtin) async {
    try {
      final response = await RestServiceClient.get(
          uri: BackEndpoints.getProductDetails(gtin));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw GetProductDetailsGenericException();
      }
    } catch (e) {
      throw GetProductDetailsGenericException();
    }
  }

  Future<bool> add({
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

  Future<bool> delete(String gtin) async {
    try {
      final response = await RestServiceClient.delete(
        uri: BackEndpoints.deleteProduct(gtin),
      );

      return response.statusCode == 200;
    } on DioError catch (_) {
      throw DeleteProductGenericException();
    } catch (e) {
      throw DeleteProductGenericException();
    }
  }
}
