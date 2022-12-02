import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MainNavItem extends StatelessWidget {
  const MainNavItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.isEnabled = true,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData? icon;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    return Container(
      height: 60,
      decoration: isSelected
          ? BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppColors.mustard,
                  width: 4,
                ),
              ),
            )
          : null,
      child: MaterialButton(
        hoverColor: AppColors.lile_100,
        color: isSelected ? AppColors.mustardShadow : null,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        onPressed: isEnabled ? onTap : null,
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.mustard : Colors.white,
              size: isSelected ? 25 : 20,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                  color: isSelected ? AppColors.lileShadow : Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
