import 'package:admin_panel/ui/add_resource/add_resource_view.dart';
import 'package:admin_panel/ui/constants/colors.dart';
import 'package:admin_panel/ui/constants/theme.dart';
import 'package:admin_panel/ui/menu/menu_options.dart';
import 'package:admin_panel/ui/menu/menu_pane_view.dart';
import 'package:admin_panel/ui/products/products_view.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  MenuOptions selectedMenuItem = MenuOptions.addResource;

  void _selectMenuOption(MenuOptions newOption) => setState(() {
        selectedMenuItem = newOption;
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // LEFT PANE
        Container(
          width: 300,
          color: AppColors.lile_1000,
          child: MenuPaneView(
            mainNavAction: _selectMenuOption,
            selectedMenuItem: selectedMenuItem,
          ),
        ),
        Expanded(
            child: Column(
          children: [
            // MAIN HEADER
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              height: 60,
              color: const Color.fromRGBO(247, 247, 254, 1),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'QR Link - Panel Administrador',
                      style:
                          AppTextStyle.h1.copyWith(color: AppColors.lile_600),
                    ),
                  ),
                  Text(
                    'v1.0.0-2',
                    style: AppTextStyle.h4.copyWith(color: AppColors.lile_600),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                    color: Colors.white,
                    child: Builder(builder: (context) {
                      switch (selectedMenuItem) {
                        case MenuOptions.addResource:
                          return const AddResourceView();
                        case MenuOptions.productsList:
                          return const ProductsView();
                      }
                    })))
          ],
        ))
      ],
    );
  }
}
