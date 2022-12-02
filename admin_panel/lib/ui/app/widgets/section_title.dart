import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.label,
    Key? key,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: Text(
        label,
        style: AppTextStyle.header.copyWith(color: AppColors.lile_600),
      ),
    );
  }
}
