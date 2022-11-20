import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:flutter/material.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.lile_600));
  }
}
