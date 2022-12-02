import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:admin_panel/ui/app/widgets/app_version.dart';
import 'package:flutter/material.dart';

class AppMainHeader extends StatelessWidget {
  const AppMainHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 60,
      color: const Color.fromRGBO(247, 247, 254, 1),
      child: Row(
        children: [
          Expanded(
            child: Text(
              AppStrings.appTitle,
              style: AppTextStyle.h1.copyWith(color: AppColors.lile_600),
            ),
          ),
          const AppVersion(),
        ],
      ),
    );
  }
}
