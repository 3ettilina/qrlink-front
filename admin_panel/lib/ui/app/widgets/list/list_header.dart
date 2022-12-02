import 'package:flutter/material.dart';

class CustomListHeader extends StatelessWidget {
  const CustomListHeader({required this.headerItems, Key? key})
      : super(key: key);

  final List<Widget> headerItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(children: headerItems),
    );
  }
}
