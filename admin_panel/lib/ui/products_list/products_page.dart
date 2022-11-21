import 'package:admin_panel/ui/app/widgets/section_title.dart';
import 'package:admin_panel/ui/products_list/bloc/products_list_bloc.dart';
import 'package:admin_panel/ui/products_list/widgets/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsListBloc()..add(const ProductsListFetchRequested()),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: const [
          SectionTitle(label: 'Listado de productos'),
          Expanded(child: ProductsView()),
        ],
      ),
    );
  }
}
