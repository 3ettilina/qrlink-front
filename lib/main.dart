import 'package:flutter/material.dart';
import 'package:qrlink/presentation/home.dart';

void main() {
  String? gtin = Uri.base.queryParameters["gtin"];
  runApp(MyApp(
    gtin: gtin,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.gtin,
  }) : super(key: key);

  final String? gtin;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'QRLink v1.0.0-5',
        gtin: gtin,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    this.gtin,
  }) : super(key: key);
  final String title;
  final String? gtin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Home(
        gtin: gtin,
      ),
    );
  }
}
