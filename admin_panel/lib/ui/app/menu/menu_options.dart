import 'package:admin_panel/ui/app/constants/strings.dart';
import 'package:admin_panel/ui/app/routes/main_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

enum MenuOptions {
  productsList(
      AppStrings.products, Icons.shopping_bag_outlined, ProductsRoute()),
  addProduct(
      AppStrings.addProduct, Icons.local_shipping_outlined, AddProductRoute());

  const MenuOptions(this.label, this.icon, this.route);

  final String label;
  final IconData icon;
  final PageRouteInfo route;
}
