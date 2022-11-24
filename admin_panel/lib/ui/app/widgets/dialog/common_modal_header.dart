import 'package:admin_panel/ui/app/constants/colors.dart';
import 'package:admin_panel/ui/app/constants/theme.dart';
import 'package:flutter/material.dart';

class CommonModalHeader extends StatelessWidget {
  const CommonModalHeader({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        color: AppColors.lile_600_15,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.mustard,
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            if (title != null) ...[
              Text(title!, style: AppTextStyle.h1),
              const SizedBox(height: 10.0),
            ]
          ],
        ),
      ),
    );
  }
}
