import 'package:devicelocale/devicelocale.dart';
import 'package:dio/dio.dart';
import 'package:qrlink/data/endpoints.dart';
import 'package:qrlink/data/exceptions.dart';

class ProductsRepository {
  static Future<Map<String, dynamic>?> getProductResource({
    required String gtin,
    String? linkType,
  }) async {
    final client = Dio();

    // Get current language
    String? completeLang = await Devicelocale.currentLocale;
    String? lang = completeLang?.split('-')[0];

    try {
      var response = await client.getUri(
          BackEndpoints.getProductResources(gtin: gtin, linkType: linkType),
          options: Options(
              followRedirects: false,
              validateStatus: (status) => status! < 400,
              headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Accept-Language": lang,
              }));

      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        throw ProductNotFoundException(gtin);
      } else {
        throw SomethingWentWrongException(gtin);
      }
    } catch (e) {
      print(e);
    }
  }
}
