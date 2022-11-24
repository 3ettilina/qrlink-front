import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

class GetProductState extends StatelessWidget {
  const GetProductState(
      {required this.assetName, required this.label, Key? key})
      : super(key: key);

  final String assetName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // SizedBox(width: 300, child: Lottie.asset(assetName)),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}
