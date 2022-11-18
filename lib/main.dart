import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:qrlink/presentation/admin/login/login_view.dart';
import 'package:qrlink/presentation/admin/register/register_view.dart';
import 'package:qrlink/presentation/home.dart';

void main() async {
  String? gtin = Uri.base.queryParameters["gtin"];
  String? linkType = Uri.base.queryParameters["linkType"];
  final appVersion = await PackageInfo.fromPlatform();
  runApp(MyApp(
    gtin: gtin,
    linkType: linkType,
    appVersion: 'v${appVersion.version}-${appVersion.buildNumber}',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.gtin,
    required this.linkType,
    required this.appVersion,
  }) : super(key: key);

  final String? gtin;
  final String? linkType;
  final String appVersion;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Link',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'QR Link',
        gtin: gtin,
        linkType: linkType,
        appVersion: appVersion,
      ),
      routes: {
        '/login': (context) => LoginView(),
        '/register': (context) => const RegisterView(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.appVersion,
    this.gtin,
    this.linkType,
  }) : super(key: key);
  final String title;
  final String? gtin;
  final String? linkType;
  final String appVersion;

  @override
  Widget build(BuildContext context) {
    return Home(
      title: title,
      appVersion: appVersion,
      gtin: gtin,
      linkType: linkType,
    );
  }
}
