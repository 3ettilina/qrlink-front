import 'dart:ui' as ui;

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:admin_panel/ui/app/widgets/common_button.dart';
import 'package:admin_panel/ui/app/widgets/custom_snackbar.dart';
import 'package:admin_panel/ui/product_details/helpers/create_qr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> showQRDialog(
    BuildContext context, String url, String title) async {
  showCommonSnackbar(
    context,
    message: 'Generando QR',
    type: SnackbarType.info,
  );

  final qrImage = await QRHelper.createQR(url);
  return showConfirmationDialog(
      context: context,
      title: 'QR Generado',
      builder: (context, widget) => Center(
            child: Card(
              margin: EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.all(20),
                width: 350,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: AppTextStyle.h2,
                        maxLines: 3,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RawImage(
                        image: qrImage,
                        scale: 0.3,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CommonButton(
                          label: 'Copiar URL',
                          onTap: () async {
                            Clipboard.setData(ClipboardData(text: url))
                                .then((_) {
                              showCommonSnackbar(context,
                                  type: SnackbarType.success,
                                  message:
                                      'La URL ha sido copiada al porta-papeles.');
                            });
                          })
                    ]),
              ),
            ),
          ));
}
