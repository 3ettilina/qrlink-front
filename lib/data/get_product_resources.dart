import 'dart:developer';
import 'dart:html' as html;
import 'dart:io';
import 'dart:js' as js;

import 'package:devicelocale/devicelocale.dart';
import 'package:dio/dio.dart';
import 'package:qrlink/data/endpoints.dart';
import 'package:qrlink/data/open_url.dart';

class GetProductResources {
  static Future<ResourceResponse> getProductResource(String gtin) async {
    final client = Dio();

    String? completeLang = await Devicelocale.currentLocale;
    String? lang = completeLang?.split('-')[0];

    try {
      var response = await client.getUri(
          Endpoints.getProductDetailsAdminDev(gtin),
          options: Options(
              followRedirects: false,
              validateStatus: (status) => status! < 400,
              headers: {
                "Content-Type": "text/html",
                "Accept": "application/json",
                "Accept-Language": lang,
              }));

      if (response.statusCode == 200) {
        final resourceUrl = response.data["resource_url"];

        // REDIRECT USER
        if (resourceUrl != null) {
          OpenUrl.byString(resourceUrl);
        }

        return ResourceResponse.location;
      } else {
        return ResourceResponse.internalServerError;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return ResourceResponse.productNotFound;
      }
      return ResourceResponse.internalServerError;
    }
  }
}

enum ResourceResponse {
  location(),
  productNotFound(),
  internalServerError();

  const ResourceResponse();
}
