import 'package:flutter/material.dart';
import 'package:qrlink/data/get_product_resources.dart';
import 'package:qrlink/presentation/constants/assets.dart';
import 'package:qrlink/presentation/constants/strings.dart';
import 'package:qrlink/presentation/widgets/get_product_state.dart';

class GetProductScreen extends StatelessWidget {
  const GetProductScreen({
    required this.gtin,
    Key? key,
  }) : super(key: key);

  final String gtin;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetProductResources.getProductResource(gtin),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.requireData) {
              case ResourceResponse.productNotFound:
                return GetProductState(
                    assetName: AppAssets.errorAnimation,
                    label: AppStrings.errorGtinNotFound(gtin));
              case ResourceResponse.internalServerError:
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
