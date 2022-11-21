import 'package:admin_panel/ui/app/constants/theme.dart';
import 'package:admin_panel/ui/app/widgets/common_loading.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_bloc.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_state.dart';
import 'package:admin_panel/ui/product_details/widgets/main_content/product_details_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        switch (state.status) {
          case ProductDetailsStatus.loading:
            return const CommonLoader();
          case ProductDetailsStatus.ready:
            return ProductDetailsContent(product: state.product!);
          case ProductDetailsStatus.error:
            return Container(
              width: 300,
              height: 250,
              color: Colors.amber,
              child: Text(
                'Error',
                style: AppTextStyle.h2,
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
