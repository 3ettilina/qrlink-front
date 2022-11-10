import 'package:qrlink/data/endpoints.dart';
import 'package:qrlink/data/exceptions.dart';
import 'package:qrlink/data/products_repository.dart';
import 'package:qrlink/domain/models/models.dart';
import 'package:qrlink/domain/result/product_result.dart';
import 'package:qrlink/domain/utils/open_url.dart';

class ProductsLogic {
  static Future<ProductResult> getProductResources(String gtin) async {
    try {
      final productJson = await ProductsRepository.getProductResource(gtin);

      if (productJson != null) {
        final product = Product.toProduct(productJson);

        if (product.resources.isEmpty) {
          // Get default resource URL
          final resourceUrl = product.resourceUrl;

          // Redirect
          OpenUrl.byString(resourceUrl);
          return ProductResult(
              product: product, type: ProductResultType.straightRedirect);
        } else {
          // If we have more than one coincidence
          // Then we should return everything without opening the URL
          if (product.resources.length > 1) {
            return ProductResult(
                product: product, type: ProductResultType.hasResources);
          } else {
            // Get resource URL of the item
            final resourceUrl = product.resources[0].resourceUrl;
            // Redirect
            OpenUrl.byString(resourceUrl);
            return ProductResult(
                product: product, type: ProductResultType.straightRedirect);
          }
        }
      }
      return ProductResult(type: ProductResultType.error);
    } on ProductNotFoundException catch (_) {
      return ProductResult(type: ProductResultType.notFound);
    } on SomethingWentWrongException catch (_) {
      return ProductResult(type: ProductResultType.error);
    }
  }

  static void openGetProductResources(String gtin) {
    OpenUrl.byString(WebUrls.webGetProductDetails(gtin));
  }

  static void openProductResource(String resourceUrl) {
    OpenUrl.blankByString(resourceUrl);
  }
}
