import 'package:admin_panel/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'ui/firebase_auth_ui/login/view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: LoginView(),
    );
  }
}

// import 'package:admin_panel/ui/app/app.dart';
// import 'package:admin_panel/ui/app/constants/constants.dart';
// import 'package:admin_panel/ui/app/routes/main_router.gr.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// void configureApp() {
//   setUrlStrategy(PathUrlStrategy());
// }

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   configureApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);

//   final _appRouter = MainRouter();

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: AppStrings.appTitle,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       debugShowCheckedModeBanner: false,
//       routerDelegate: _appRouter.delegate(),
//       routeInformationParser: _appRouter.defaultRouteParser(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return const DashboardPage();
//   }
// }