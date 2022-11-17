import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qrlink/presentation/admin/register/register_view.dart';
import 'package:qrlink/presentation/constants/assets.dart';
import 'package:qrlink/presentation/constants/theme.dart';
import 'package:qrlink/presentation/home.dart';

// class LoginDemo extends StatelessWidget {
//   @override
//   _LoginDemoState createState() => _LoginDemoState();
// }

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Text(
              'Welcome',
              style: AppTextStyle.header,
            ),
            Text(
              'Enter your email adress and password to sign in',
              style: AppTextStyle.subHeader,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
                top: 30,
              ),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    child: LottieBuilder.asset(
                      AppAssets.login,
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(
                top: 15,
                bottom: 15,
                left: 30,
                right: 30,
              )),
              //TODO: implementar logica de login
              onPressed: () {},
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('New User?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterView(),
                        ),
                      );
                    },
                    child: const Text('Create Account'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
