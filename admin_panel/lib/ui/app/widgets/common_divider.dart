import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      color: AppColors.mustard,
    );
  }
}
