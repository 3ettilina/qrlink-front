import 'package:admin_panel/ui/app/menu/menu.dart';
import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:admin_panel/ui/app/widgets/app_main_header.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  MenuOptions selectedMenuItem = MenuOptions.productsList;

  void _selectMenuOption(MenuOptions newOption) {
    context.navigateTo(newOption.route);
    setState(() {
      selectedMenuItem = newOption;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // LEFT PANE
          Container(
            width: 250,
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
              const AppMainHeader(),
              // CONTENT
              Expanded(
                  child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                color: Colors.white,
                child: const AutoRouter(),
              ))
            ],
          ))
        ],
      ),
    );
  }
}
