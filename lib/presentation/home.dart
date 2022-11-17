import 'package:flutter/material.dart';
import 'package:qrlink/presentation/admin/login/login_view.dart';
import 'package:qrlink/presentation/admin/register/register_view.dart';
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
            child: Row(
              children: [
                Text(appVersion),
              ],
            ),
          ),
          leadingWidth: 100.0,
          title: Text(title),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginView(),
                  ),
                );
              },
              child: const Text(
                'Login / Sign up',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body:
            gtin != null ? GetProductScreen(gtin: gtin!) : SearchProductView());
  }
}
