import 'dart:convert';

import 'package:admin_panel/data/endpoints.dart';
import 'package:admin_panel/data/entity/language.dart';
import 'package:admin_panel/data/entity/link_type_entity.dart';
import 'package:admin_panel/data/entity/resource_entity.dart';
import 'package:admin_panel/data/exceptions/delete_resource_exception.dart';
import 'package:admin_panel/data/exceptions/generic_exception.dart';
import 'package:admin_panel/data/exceptions/get_product_resources_exception.dart';
import 'package:admin_panel/data/service/client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

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

  Future<List<LinkTypeEntity>> getLinkTypeList() async {
    try {
      final response =
          await RestServiceClient.get(uri: BackEndpoints.getLinkTypes());

      if (response.statusCode == 200) {
        return LinkTypeEntity.toListFromJson(response.data);
      }
      throw GenericException();
    } catch (e) {
      throw GenericException();
    }
  }

  Future<List<LanguageEntity>> getLanguages() async {
    try {
      final String langJson =
          await rootBundle.loadString('assets/language.json');
      final list = LanguageEntity.fromJsonToList(langJson);
      return list;
    } catch (e) {
      throw GenericException();
    }
  }
}
