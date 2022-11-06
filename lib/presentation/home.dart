import 'package:flutter/material.dart';
import 'package:qrlink/presentation/get_product/get_product.dart';
import 'package:qrlink/presentation/search_product/search_product_view.dart';

class Home extends StatelessWidget {
  const Home(
      {required this.title, required this.appVersion, this.gtin, Key? key})
      : super(key: key);

  final String title;
  final String appVersion;
  final String? gtin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Center(
            //padding: const EdgeInsets.all(16.0),
            child: Text(appVersion),
          ),
          leadingWidth: 100.0,
          title: Text(title),
        ),
        body:
            gtin != null ? GetProductScreen(gtin: gtin!) : SearchProductView());
  }
}
