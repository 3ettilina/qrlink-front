import 'package:admin_panel/ui/constants/colors.dart';
import 'package:admin_panel/ui/menu/widgets/main_nav_item.dart';
import 'package:admin_panel/ui/constants/assets.dart';
import 'package:admin_panel/ui/menu/menu_options.dart';
import 'package:flutter/material.dart';

class MenuPaneView extends StatelessWidget {
  const MenuPaneView({
    this.selectedMenuItem = MenuOptions.addResource,
    required this.mainNavAction,
    Key? key,
  }) : super(key: key);

  final MenuOptions selectedMenuItem;
  final Function mainNavAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        // LOGO
        Container(
          height: 170,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.mustard_75, width: 4)),
              image: DecorationImage(
                scale: 1.4,
                image: AssetImage(AppAssets.qrlinkLogo),
              )),
        ),
        const SizedBox(
          height: 50,
        ),
        // MAIN SECTION
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MainNavItem(
                label: 'Agregar producto',
                icon: Icons.local_shipping_outlined,
                isSelected: selectedMenuItem == MenuOptions.addProduct,
                onTap: () => mainNavAction(MenuOptions.addProduct)),
            const SizedBox(
              height: 16,
            ),
            MainNavItem(
                label: 'Agregar recurso',
                icon: Icons.add_circle_outline_outlined,
                isSelected: selectedMenuItem == MenuOptions.addResource,
                onTap: () => mainNavAction(MenuOptions.addResource)),
            const SizedBox(
              height: 16,
            ),
            MainNavItem(
              label: 'Productos',
              icon: Icons.shopping_bag_outlined,
              isSelected: selectedMenuItem == MenuOptions.productsList,
              onTap: () => mainNavAction(MenuOptions.productsList),
              isEnabled: false,
            ),
          ],
        )),
      ],
    );
  }
}
