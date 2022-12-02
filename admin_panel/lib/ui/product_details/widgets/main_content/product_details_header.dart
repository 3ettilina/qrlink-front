import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:admin_panel/ui/app/widgets/common_button.dart';
import 'package:admin_panel/ui/app/widgets/common_text.dart';
import 'package:admin_panel/ui/app/widgets/custom_snackbar.dart';
import 'package:admin_panel/ui/app/widgets/dialog/common_modal.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_bloc.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_event.dart';
import 'package:admin_panel/ui/product_details/helpers/create_qr.dart';
import 'package:admin_panel/ui/product_details/widgets/edit_product/bloc/edit_product_bloc.dart';
import 'package:admin_panel/ui/product_details/widgets/edit_product/edit_product_view.dart';
import 'package:admin_panel/ui/product_details/widgets/qr_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

    Widget _spacer() => const SizedBox(height: 5);

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
              _spacer(),
              Text('GTIN:', style: AppTextStyle.h2),
              CommonText(product.gtin, copyToClipboard: true),
              _spacer(),
              Text('URL destino:', style: AppTextStyle.h2),
              CommonText(defaultResource.resourceUrl, copyToClipboard: true),
              _spacer(),
              Text('¿Solo redirección?', style: AppTextStyle.h2),
              if (product.onlyRedirect)
                Text('Sí. Este producto redirige por defecto')
              else
                Text(
                    'No. Este producto retorna todos los recursos coincidentes.')
            ],
          ),
        ),
        Column(
          children: [
            CommonButton(
              content: const Icon(Icons.edit),
              type: CommonButtonType.info,
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
            SizedBox(
              height: 10,
            ),
            CommonButton(
                onTap: () async {
                  final baseURL =
                      'https://qrlink-dev.web.app/?gtin=${product.gtin}';

                  showQRDialog(context, baseURL,
                      'QR asociado al recurso: \n${defaultResource.name}');
                },
                content: const Icon(Icons.qr_code_2_outlined)),
          ],
        )
      ],
    );
  }
}
