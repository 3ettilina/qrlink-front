import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/ui/app/constants/colors.dart';
import 'package:admin_panel/ui/app/routes/main_router.gr.dart';
import 'package:admin_panel/ui/app/widgets/common_button.dart';
import 'package:admin_panel/ui/app/widgets/common_divider.dart';
import 'package:admin_panel/ui/app/widgets/custom_snackbar.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_bloc.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_event.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_state.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/add_resource_form.dart';
import 'package:admin_panel/ui/product_details/widgets/main_content/product_details_header.dart';
import 'package:admin_panel/ui/product_details/widgets/resources_list/resources_list_content.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({required this.product, Key? key})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final resourceListToShow = product.resources.sublist(1);
    final bloc = context.read<ProductDetailsBloc>();
    return BlocListener<ProductDetailsBloc, ProductDetailsState>(
      listener: (context, state) {
        if (state.status == ProductDetailsStatus.productDeleted) {
          context.popRoute();
          showCommonSnackbar(
            context,
            message: '#${product.gtin} ha sido borrado satisfactoriamente!',
            type: SnackbarType.success,
          );
        }
        if (state.status == ProductDetailsStatus.error) {
          showCommonSnackbar(
            context,
            message: 'No se ha podido eliminar el producto',
            type: SnackbarType.failure,
          );
        }
      },
      child: Card(
        elevation: 5,
        shadowColor: AppColors.mustardShadow,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product details
              ProductDetailsHeader(product: product),
              const SizedBox(height: 15),
              const CommonDivider(),
              const SizedBox(height: 30),

              // Resources List
              if (resourceListToShow.isNotEmpty)
                Expanded(
                    child: ResourcesListContent(resources: resourceListToShow)),

              const SizedBox(height: 5),
              const AddResourceForm(),
              const SizedBox(height: 20),

              const CommonDivider(),
              const SizedBox(height: 30),
              // DELETE PRODUCT
              Center(
                child: CommonButton(
                  label: 'Eliminar producto',
                  onTap: () {
                    showCommonSnackbar(
                      context,
                      message: 'Borrando producto: #${product.gtin}',
                      type: SnackbarType.info,
                    );
                    bloc.add(ProductDetailsDeleteProductRequested(
                        gtin: product.gtin));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
