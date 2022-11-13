import 'package:flutter/material.dart';
import 'package:qrlink/domain/products_logic.dart';
import 'package:qrlink/domain/result/product_result.dart';
import 'package:qrlink/presentation/constants/assets.dart';
import 'package:qrlink/presentation/constants/strings.dart';
import 'package:qrlink/presentation/get_product/widgets/get_product_state.dart';
import 'package:qrlink/presentation/product_details/product_details_view.dart';

class GetProductScreen extends StatelessWidget {
  const GetProductScreen({
    required this.gtin,
    this.linkType,
    Key? key,
  }) : super(key: key);

  final String gtin;
  final String? linkType;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductResult>(
        future:
            ProductsLogic.getProductResources(gtin: gtin, linkType: linkType),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final result = snapshot.requireData;
            switch (result.type) {
              case ProductResultType.hasResources:
                return ProductView(product: result.product!);
              case ProductResultType.notFound:
                return GetProductState(
                    assetName: AppAssets.errorAnimation,
                    label: AppStrings.errorGtinNotFound(gtin));
              case ProductResultType.error:
                return GetProductState(
                    assetName: AppAssets.errorAnimation,
                    label: AppStrings.errorGeneric);
              default:
                return GetProductState(
                    assetName: AppAssets.successAnimation,
                    label: AppStrings.resourceFound);
            }
          }
          if (snapshot.hasError) {
            return GetProductState(
                assetName: AppAssets.errorAnimation,
                label: AppStrings.errorGeneric);
          }
          return GetProductState(
              assetName: AppAssets.loadingAnimation,
              label: AppStrings.searchingResource);
        });
  }
}
