import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRHelper {
  static Future<ui.Image> createQR(String url) async {
    final recorder = ui.PictureRecorder();
    Canvas canvas = Canvas(recorder);
    const size = Size(250, 250);
    final painter = QrPainter(
      data: url,
      version: QrVersions.auto,
    );
    canvas.save();
    painter.paint(canvas, size);
    canvas.restore();
    final data = recorder
        .endRecording()
        .toImage(size.width.floor(), size.height.floor());
    return data;
  }
}
