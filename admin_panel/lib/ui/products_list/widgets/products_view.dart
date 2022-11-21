import 'package:admin_panel/ui/app/constants/colors.dart';
import 'package:admin_panel/ui/app/widgets/common_loading.dart';
import 'package:admin_panel/ui/products_list/bloc/products_list_bloc.dart';
import 'package:admin_panel/ui/products_list/widgets/products_list.dart';
import 'package:admin_panel/ui/products_list/widgets/products_list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsListBloc, ProductsListState>(
        builder: (context, state) {
      if (state.status == ProductsListStatus.loading) {
        return const CommonLoader();
      }
      if (state.products.isNotEmpty) {
        return Column(
          children: [
            const ProductsListHeader(),
            Expanded(child: ProductsList(products: state.products))
          ],
        );
      }
      // TODO(betti): clean this up
      return Container(
        width: 300,
        height: 200,
        color: AppColors.lileShadow,
      );
    });
  }
}
