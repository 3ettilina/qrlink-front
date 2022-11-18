import 'package:admin_panel/ui/app/constants/strings.dart';
import 'package:flutter/material.dart';

enum MenuOptions {
  addProduct(AppStrings.addProduct, Icons.local_shipping_outlined),
  addResource(AppStrings.addResource, Icons.add_circle_outline_outlined),
  productsList(AppStrings.products, Icons.shopping_bag_outlined);

  const MenuOptions(this.name, this.icon);

  final String name;
  final IconData icon;
}
