import 'package:admin_panel/ui/app/menu/menu.dart';
import 'package:admin_panel/ui/app/menu/widgets/main_nav_item.dart';
import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:flutter/material.dart';

class MenuPaneView extends StatelessWidget {
  const MenuPaneView({
    required this.selectedMenuItem,
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
        const SizedBox(height: 50),
        // MAIN SECTION
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: MenuOptions.values
                .map(
                  (menuOption) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: MainNavItem(
                        label: menuOption.label,
                        icon: menuOption.icon,
                        isSelected: selectedMenuItem == menuOption,
                        onTap: () => mainNavAction(menuOption)),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
