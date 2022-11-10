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
              product.name,
              style: AppTextStyle.header.copyWith(
                color: Colors.indigo,
              ),
            ),
          ),
        ),
        Text(
          AppStrings.productDetails,
          style: AppTextStyle.subHeader,
        ),
        const SizedBox(
          height: 20,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 1,
                    color: Colors.blueGrey[100],
                    child: ListTile(
                      leading: const Icon(Icons.link),
                      title: Text(
                        res.name,
                        // style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(res.linkType),
                    ),
                  ),
                ),
              ))
          .toList(),
    ),
  );
}
