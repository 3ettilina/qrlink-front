import 'dart:ui' as ui;

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:admin_panel/domain/models/models.dart';
import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:admin_panel/ui/app/widgets/common_button.dart';
import 'package:admin_panel/ui/app/widgets/common_text.dart';
import 'package:admin_panel/ui/app/widgets/custom_snackbar.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_bloc.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_event.dart';
import 'package:admin_panel/ui/product_details/bloc/product_details_state.dart';
import 'package:admin_panel/ui/product_details/helpers/create_qr.dart';
import 'package:admin_panel/ui/product_details/widgets/qr_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResourcesListItemContent extends StatelessWidget {
  const ResourcesListItemContent({required this.resource, Key? key})
      : super(key: key);

  final Resource resource;

  Widget _textWidget(String text, {bool copyToClipboard = false}) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: CommonText(
        text,
        copyToClipboard: copyToClipboard,
      ));

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsBloc>();
    final state = cubit.state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(flex: 6, child: _textWidget(resource.name)),
        Expanded(flex: 2, child: _textWidget(resource.language ?? '')),
        Expanded(flex: 4, child: _textWidget(resource.linkType ?? '')),
        Expanded(
            flex: 6,
            child: _textWidget(resource.resourceUrl, copyToClipboard: true)),
        Expanded(
            flex: 2,
            child: Column(children: [
              CommonButton(
                  type: CommonButtonType.alert,
                  onTap: () {
                    cubit.add(
                      ProductDetailsDeleteResourceRequested(
                          gtin: state.gtin!, resource: resource),
                    );
                    showCommonSnackbar(
                      context,
                      message: 'Eliminando recurso...',
                      type: SnackbarType.info,
                    );
                  },
                  content: const Icon(Icons.delete)),
              SizedBox(height: 7),
              CommonButton(
                  onTap: () async {
                    final baseURL =
                        'https://qrlink-dev.web.app/?gtin=${state.gtin}';
                    final linkType = resource.linkType;
                    if (linkType != null) {
                      final urlForQR = '$baseURL&linkType=$linkType';

                      showQRDialog(context, urlForQR,
                          'QR asociado al recurso: ${resource.name}');
                    } else {
                      showQRDialog(context, baseURL,
                          'QR asociado al recurso: ${resource.name}');
                    }
                  },
                  content: const Icon(Icons.qr_code_2_outlined)),
            ])),
      ],
    );
  }
}
