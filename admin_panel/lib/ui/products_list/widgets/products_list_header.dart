import 'package:admin_panel/ui/app/widgets/list/list_header.dart';
import 'package:admin_panel/ui/app/widgets/table_header_label.dart';
import 'package:flutter/material.dart';

class ProductsListHeader extends StatelessWidget {
  const ProductsListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomListHeader(
      headerItems: [
        Expanded(flex: 3, child: TableHeaderLabel(label: 'GTIN')),
        Expanded(flex: 5, child: TableHeaderLabel(label: 'Nombre')),
        Expanded(flex: 2, child: TableHeaderLabel(label: 'Cant. recursos')),
        Expanded(flex: 2, child: TableHeaderLabel(label: 'Solo redirección')),
        Expanded(child: TableHeaderLabel(label: 'Acciones')),
      ],
    );
  }
}
