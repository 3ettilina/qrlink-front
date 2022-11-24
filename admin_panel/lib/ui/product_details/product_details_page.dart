import 'package:admin_panel/ui/app/widgets/custom_snackbar.dart';
import 'package:admin_panel/ui/app/widgets/section_title.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_bloc.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_event.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_state.dart';
import 'package:admin_panel/ui/product_details/constants/strings.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_bloc.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_state.dart';
import 'package:admin_panel/ui/product_details/widgets/product_details_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    @PathParam('gtin') required this.gtin,
    Key? key,
  }) : super(key: key);

  final String gtin;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ProductDetailsBloc()
              ..add(ProductDetailsProductSelected(gtin: gtin))),
        BlocProvider(create: (context) => AddResourceBloc(gtin))
      ],
      child: BlocListener<ProductDetailsBloc, ProductDetailsState>(
        listener: (context, state) {
          if (state.status == ProductDetailsStatus.resourceDeleted) {
            showCommonSnackbar(
              context,
              message: ProductDetailsStrings.resourceHasBeenDeleted,
              type: SnackbarType.success,
            );
            context
                .read<ProductDetailsBloc>()
                .add(ProductDetailsProductSelected(gtin: gtin));
          }
        },
        child: BlocListener<AddResourceBloc, AddResourceState>(
          listener: (context, state) {
            final productBloc = context.read<ProductDetailsBloc>();
            if (state.status == AddResourceStatus.loading) {
              showCommonSnackbar(
                context,
                message: ProductDetailsStrings.addingResource,
                type: SnackbarType.info,
              );
            }
            if (state.status == AddResourceStatus.resourceAddedSuccessfully) {
              productBloc.add(ProductDetailsProductSelected(gtin: gtin));
              showCommonSnackbar(
                context,
                message: ProductDetailsStrings.resourceAddedSuccesfully,
                type: SnackbarType.success,
              );
            }
            if (state.status == AddResourceStatus.resourceAlreadyExistsError) {
              showCommonSnackbar(
                context,
                message: ProductDetailsStrings.resourceAlreadyExists,
                type: SnackbarType.failure,
              );
            }
          },
          child: Column(
            children: const [
              SectionTitle(label: 'Detalle de producto'),
              Expanded(child: ProductDetailsView()),
            ],
          ),
        ),
      ),
    );
  }
}
