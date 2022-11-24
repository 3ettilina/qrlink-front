import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/ui/app/routes/main_router.gr.dart';
import 'package:admin_panel/ui/app/widgets/list/list_view.dart';
import 'package:admin_panel/ui/products_list/widgets/product_list_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({required this.products, Key? key}) : super(key: key);

  final List<Product> products;

  Widget _productToWidget(Product p) => ProductListItemContent(product: p);

  void _onProductTap(BuildContext context, Product p) {
    context.pushRoute(ProductDetailsRoute(
      gtin: p.gtin,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      listContents: products,
      itemListContentBuilder: _productToWidget,
      onItemTap: (Product product) => _onProductTap(context, product),
    );
  }
}
