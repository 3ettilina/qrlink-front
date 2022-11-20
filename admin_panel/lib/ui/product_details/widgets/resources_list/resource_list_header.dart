import 'package:admin_panel/ui/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResourcesListHeader extends StatelessWidget {
  const ResourcesListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomListHeader(
      headerItems: [
        Expanded(flex: 3, child: TableHeaderLabel(label: 'Nombre')),
        Expanded(child: TableHeaderLabel(label: 'Idioma')),
        Expanded(flex: 2, child: TableHeaderLabel(label: 'Link Type')),
        Expanded(flex: 3, child: TableHeaderLabel(label: 'URL destino')),
      ],
    );
  }
}
