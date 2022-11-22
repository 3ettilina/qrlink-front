import 'package:admin_panel/data/endpoints.dart';
import 'package:admin_panel/data/exceptions/delete_product_exception.dart';
import 'package:admin_panel/data/service/client.dart';
import 'package:dio/dio.dart';

class DeleteProductService {
  Future<bool> call(String gtin) async {
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
