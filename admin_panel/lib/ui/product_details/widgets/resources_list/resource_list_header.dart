import 'package:admin_panel/ui/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResourcesListHeader extends StatelessWidget {
  const ResourcesListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomListHeader(
      headerItems: [
        Expanded(flex: 6, child: TableHeaderLabel(label: 'Nombre')),
        Expanded(flex: 2, child: TableHeaderLabel(label: 'Idioma')),
        Expanded(flex: 4, child: TableHeaderLabel(label: 'Link Type')),
        Expanded(flex: 6, child: TableHeaderLabel(label: 'URL destino')),
        Expanded(flex: 2, child: TableHeaderLabel(label: 'Más')),
      ],
    );
  }
}
