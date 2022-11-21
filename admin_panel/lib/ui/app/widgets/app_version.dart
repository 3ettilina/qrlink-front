import 'package:admin_panel/ui/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final appInfo = snapshot.requireData;
            final appVersion = '${appInfo.version}-${appInfo.buildNumber}';
            return Text(
              appVersion,
              style: AppTextStyle.h4.copyWith(color: AppColors.lile_600),
            );
          }
          return const SizedBox.shrink();
        });
  }
}
