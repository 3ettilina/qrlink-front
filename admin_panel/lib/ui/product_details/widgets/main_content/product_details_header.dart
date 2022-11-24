import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/ui/app/constants/constants.dart';
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
        Text('Nombre:', style: AppTextStyle.h2),
        Text(defaultResource.name),
        SizedBox(height: 5),
        Text('GTIN:', style: AppTextStyle.h2),
        Text(product.gtin),
        SizedBox(height: 5),
        Text('URL destino:', style: AppTextStyle.h2),
        Text(defaultResource.resourceUrl),
      ],
    );
  }
}
