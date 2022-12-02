import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:qrlink/domain/products_logic.dart';
import 'package:qrlink/presentation/constants/constants.dart';

class SearchProductView extends StatelessWidget {
  SearchProductView({Key? key}) : super(key: key);

  final _gtinController = TextEditingController();
  final _linkTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            width: 500,
            child: Column(
              children: [
                // LottieBuilder.asset(
                //   AppAssets.welcome,
                // ),
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
                TextField(
                  controller: _gtinController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: '32893489234'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _linkTypeController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'gs1:tutorial'),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    assert(_gtinController.text.isNotEmpty);
                    ProductsLogic.openGetProductResources(
                      gtin: _gtinController.text,
                      linkType: _linkTypeController.text,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.indigoAccent,
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Align(
                      child: Text(
                        AppStrings.search,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
