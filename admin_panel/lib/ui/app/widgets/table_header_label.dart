import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:flutter/material.dart';

class TableHeaderLabel extends StatelessWidget {
  const TableHeaderLabel({required this.label, Key? key}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Text(
        label,
        style: AppTextStyle.h2,
        softWrap: true,
        maxLines: 2,
        textWidthBasis: TextWidthBasis.parent,
      ),
    );
  }
}
