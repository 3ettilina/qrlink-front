import 'package:admin_panel/firebase_options.dart';
import 'package:admin_panel/ui/app/constants/colors.dart';
import 'package:admin_panel/ui/app/constants/strings.dart';
import 'package:admin_panel/ui/app/routes/main_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'ui/firebase_auth_ui/login/view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = MainRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorSchemeSeed: AppColors.lile_500,
        cardColor: AppColors.lileShadow,
      ),
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
