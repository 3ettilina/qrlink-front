import 'package:admin_panel/ui/app/widgets/list/list_item.dart';
import 'package:flutter/material.dart';

class CustomListView<T> extends StatelessWidget {
  const CustomListView({
    required this.listContents,
    required this.itemListContentBuilder,
    this.onItemTap,
    Key? key,
  }) : super(key: key);

  final Iterable<T> listContents;
  final Widget Function(T) itemListContentBuilder;
  final void Function(T)? onItemTap;

  @override
  Widget build(BuildContext context) {
    final onTap = onItemTap; // Unwrap
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 30),
        child: Column(children: [
          ...listContents
              .map((T p) => GestureDetector(
                  onTap: onTap != null ? () => onTap(p) : null,
                  child: CustomListItem(content: itemListContentBuilder(p))))
              .toList(),
        ]),
      ),
    );
  }
}
