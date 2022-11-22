import 'package:admin_panel/data/entity/product_entity.dart';
import 'package:admin_panel/data/entity/resource_entity.dart';
import 'package:admin_panel/data/service/add_product_service.dart';
import 'package:admin_panel/data/service/add_resource_service.dart';
import 'package:admin_panel/data/service/delete_product.dart';
import 'package:admin_panel/data/service/get_product_details_service.dart';
import 'package:admin_panel/data/service/get_products_service.dart';

class ProductsRepository {
  ProductsRepository({
    AddProductService? addProductService,
    AddResourceService? addResourceService,
    GetProductsService? getProductsService,
    GetProductDetailsService? getProductDetailsService,
    DeleteProductService? deleteProductService,
  })  : _addProductService = addProductService ?? AddProductService(),
        _addResourceService = addResourceService ?? AddResourceService(),
        _getProductsService = getProductsService ?? GetProductsService(),
        _getProductDetailsService =
            getProductDetailsService ?? GetProductDetailsService(),
        _deleteProductService = deleteProductService ?? DeleteProductService();

  final AddProductService _addProductService;
  final AddResourceService _addResourceService;
  final GetProductsService _getProductsService;
  final GetProductDetailsService _getProductDetailsService;
  final DeleteProductService _deleteProductService;

  Future<bool> addProduct({
    required String gtin,
    required bool onlyRedirect,
    required String name,
    required String resourceUrl,
  }) async {
    return _addProductService(
      gtin: gtin,
      name: name,
      onlyRedirect: onlyRedirect,
      resourceUrl: resourceUrl,
    );
  }

  Future<bool> addResourceToProduct({
    required String gtin,
    required String resourceName,
    required String? resourceLinkType,
    required String? resourceLanguage,
    required String resourceUrl,
  }) async {
    final resourceJson = ResourceEntity.toJson(
      name: resourceName,
      url: resourceUrl,
      language: resourceLanguage,
      linkType: resourceLinkType,
    );
    return _addResourceService(gtin, resourceJson);
  }

  Future<List<ProductEntity>> getProductList() async {
    final productsJson = await _getProductsService.call();
    return ProductEntity.toListFromJson(productsJson);
  }

  Future<ProductEntity> getProductDetails(String gtin) async {
    final productJson = await _getProductDetailsService.call(gtin);
    return ProductEntity.fromJson(productJson);
  }

  Future<bool> deleteProduct(String gtin) async {
    final result = await _deleteProductService(gtin);
    return result;
  }
}
