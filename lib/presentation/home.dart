import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qrlink/data/endpoints.dart';
import 'package:qrlink/data/open_url.dart';
import 'package:qrlink/presentation/constants/assets.dart';
import 'package:qrlink/presentation/constants/strings.dart';
import 'package:qrlink/presentation/constants/theme.dart';
import 'package:qrlink/presentation/get_product.dart';

class Home extends StatelessWidget {
  Home({this.gtin, Key? key}) : super(key: key);

  final String? gtin;

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (gtin != null) {
      return GetProductScreen(gtin: gtin!);
    } else {
      return Center(
        child: SizedBox(
          width: 500,
          child: Column(
            children: [
              LottieBuilder.asset(
                AppAssets.welcome,
              ),
              Text(
                AppStrings.welcome,
                style: AppTextStyle.header,
              ),
              const SizedBox(
                height: 36,
              ),
              Text(
                AppStrings.addGtinToSearchLabel,
                style: AppTextStyle.subHeader,
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '32893489234'),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      OpenUrl.byString(
                          Endpoints.webGetProductDetails(_controller.text));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.indigoAccent,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Text(
                        AppStrings.search,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }
  }
}
