import 'package:flutter/material.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({required this.content, Key? key}) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: content,
      ),
    );
  }
}
