import 'package:flutter/material.dart';
import 'package:qrlink/domain/models/product.dart';
import 'package:qrlink/domain/models/resource.dart';
import 'package:qrlink/domain/products_logic.dart';
import 'package:qrlink/presentation/constants/constants.dart';

/// Shows the list of resources that the product has
/// so the user can tap on them and be redirected to the URL it contains
class ProductView extends StatelessWidget {
  const ProductView({required this.product, Key? key}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final resources = product.resources;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Center(
            child: Text(
              AppStrings.productDetails,
              style: AppTextStyle.header,
            ),
          ),
        ),
        Card(
          color: Colors.lightGreen,
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Text(product.name),
          ),
        ),
        _resourcesList(resources),
      ],
    );
  }
}

Widget _resourcesList(List<Resource> resources) {
  return Container(
    alignment: Alignment.topCenter,
    padding: const EdgeInsets.symmetric(horizontal: 35.0),
    child: Column(
      children: resources
          .map((res) => SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () =>
                      ProductsLogic.openProductResource(res.resourceUrl),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16),
                      child: Text(res.name),
                    ),
                  ),
                ),
              ))
          .toList(),
    ),
  );
}