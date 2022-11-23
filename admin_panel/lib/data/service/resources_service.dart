import 'package:admin_panel/data/endpoints.dart';
import 'package:admin_panel/data/entity/resource_entity.dart';
import 'package:admin_panel/data/exceptions/delete_resource_exception.dart';
import 'package:admin_panel/data/exceptions/get_product_resources_exception.dart';
import 'package:admin_panel/data/service/client.dart';
import 'package:dio/dio.dart';

class ResourceService {
  Future<bool> add(String gtin, Map<String, dynamic> resource) async {
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

  Future<bool> edit(String gtin, ResourceEntity resourceEntity) async {
    try {
      final response = await RestServiceClient.delete(
        uri: BackEndpoints.editResource(gtin),
        data: ResourceEntity.toJson(resourceEntity),
      );

      return response.statusCode == 200;
    } on DioError catch (_) {
      throw DeleteResourceGenericException();
    } catch (e) {
      throw DeleteResourceGenericException();
    }
  }

  Future<bool> delete(String gtin, ResourceEntity resourceEntity) async {
    try {
      final response = await RestServiceClient.delete(
        uri: BackEndpoints.deleteResource(gtin),
        data: ResourceEntity.toJson(resourceEntity),
      );

      return response.statusCode == 200;
    } on DioError catch (_) {
      throw DeleteResourceGenericException();
    } catch (e) {
      throw DeleteResourceGenericException();
    }
  }
}
