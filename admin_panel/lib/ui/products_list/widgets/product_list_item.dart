import 'package:admin_panel/domain/models/models.dart';
import 'package:flutter/material.dart';

class ProductListItemContent extends StatelessWidget {
  const ProductListItemContent({required this.product, Key? key})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final productName = product.resources
        .firstWhere((element) => element.linkType == 'gs1:defaultLink')
        .name;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(flex: 3, child: Text('# ${product.gtin}')),
        Expanded(flex: 5, child: Text(productName)),
        Expanded(flex: 2, child: Text('${product.resources.length}')),
        Expanded(
            flex: 2,
            child: product.onlyRedirect ? const Text('Sí') : const Text('No')),
        const Expanded(child: Center(child: Icon(Icons.remove_red_eye))),
      ],
    );
  }
}
