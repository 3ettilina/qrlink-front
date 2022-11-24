import 'package:admin_panel/data/entity/product_entity.dart';
import 'package:admin_panel/data/service/products_service.dart';
import 'package:admin_panel/data/service/resources_service.dart';

class ProductsRepository {
  ProductsRepository({
    ProductsService? productsService,
    ResourceService? resourceService,
  }) : _productsService = productsService ?? ProductsService();

  final ProductsService _productsService;

  Future<bool> addProduct({
    required String gtin,
    required bool onlyRedirect,
    required String name,
    required String resourceUrl,
  }) async {
    return _productsService.add(
      gtin: gtin,
      name: name,
      onlyRedirect: onlyRedirect,
      resourceUrl: resourceUrl,
    );
  }

  Future<List<ProductEntity>> getProductList() async {
    final productsJson = await _productsService.getProductsList();
    return ProductEntity.toListFromJson(productsJson);
  }

  Future<ProductEntity> getProductDetails(String gtin) async {
    final productJson = await _productsService.getProductDetails(gtin);
    return ProductEntity.fromJson(productJson);
  }

  Future<bool> deleteProduct(String gtin) async {
    final result = await _productsService.delete(gtin);
    return result;
  }

  Future<bool> editProduct(
      {required String gtin,
      bool isOnlyRedirect = false,
      required String name,
      required String resourceUrl}) async {
    final result = await _productsService.editProductDetails(
      gtin: gtin,
      isOnlyRedirect: isOnlyRedirect,
      name: name,
      resourceUrl: resourceUrl,
    );
    return result;
  }
}
