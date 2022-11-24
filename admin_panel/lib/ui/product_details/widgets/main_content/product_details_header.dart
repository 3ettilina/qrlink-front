import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:admin_panel/ui/app/widgets/common_button.dart';
import 'package:admin_panel/ui/app/widgets/dialog/common_modal.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_bloc.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_event.dart';
import 'package:admin_panel/ui/product_details/widgets/add_resource/bloc/add_resource_bloc.dart';
import 'package:admin_panel/ui/product_details/widgets/edit_product/bloc/edit_product_bloc.dart';
import 'package:admin_panel/ui/product_details/widgets/edit_product/edit_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({
    required this.product,
    Key? key,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final defaultResource = product.resources.firstWhere(
      (element) => element.linkType == 'gs1:defaultLink',
    );

    final productDetailsBloc = context.read<ProductDetailsBloc>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Text('Nombre:', style: AppTextStyle.h2),
              Text(defaultResource.name),
              SizedBox(height: 5),
              Text('GTIN:', style: AppTextStyle.h2),
              Text(product.gtin),
              SizedBox(height: 5),
              Text('URL destino:', style: AppTextStyle.h2),
              Text(defaultResource.resourceUrl),
              SizedBox(height: 5),
              Text('¿Solo redirección?', style: AppTextStyle.h2),
              if (product.onlyRedirect)
                Text('Sí. Este producto redirige por defecto')
              else
                Text(
                    'No. Este producto retorna todos los recursos coincidentes.')
            ],
          ),
        ),
        CommonButton(
          content: Icon(Icons.edit),
          onTap: () async {
            final result = await showCommonDialog(context,
                title: 'Editar producto',
                content: BlocProvider<EditProductBloc>(
                  create: (context) =>
                      EditProductBloc(product, defaultResource),
                  child: const EditProductView(),
                ));

            if (result) {
              productDetailsBloc
                  .add(ProductDetailsProductSelected(gtin: product.gtin));
            }
          },
        ),
      ],
    );
  }
}
