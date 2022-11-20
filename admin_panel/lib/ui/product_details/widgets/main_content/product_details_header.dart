import 'package:admin_panel/domain/models/models.dart';
import 'package:flutter/material.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({
    required this.product,
    Key? key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final defaultResource = product.resources.firstWhere(
      (element) => element.linkType == 'gs1:defaultLink',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADER
        Text('Nombre: ${defaultResource.name}'),
        Text('GTIN: ${product.gtin}'),
        Text('URL destino: ${defaultResource.resourceUrl}'),
      ],
    );
  }
}
