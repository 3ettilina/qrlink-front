import 'package:admin_panel/ui/app/routes/main_router.gr.dart';
import 'package:admin_panel/ui/app/widgets/input_text.dart';
import 'package:auto_route/auto_route.dart';

import '../../signup/view/signup_view.dart';
import 'package:auth_service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  String _email = '';
  String _password = '';

  void updateText({
    String? email,
    String? password,
  }) {
    setState(() {
      if (email != null) {
        _email = email;
      }
      if (password != null) {
        _password = password;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: InputText(
                label: 'email',
                hintText: 'email',
                validatorMessage: 'Por favor ingresa email',
                allowSpaces: false,
                onChange: (value) => updateText(email: value),
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: InputText(
                label: 'password',
                hintText: 'password',
                validatorMessage: 'Por favor ingresa contraseña',
                allowSpaces: false,
                obscureText: true,
                onChange: (value) => updateText(password: value),
              ),
            ),
            const SizedBox(height: 30.0),
            _SubmitButton(
              email: _email,
              password: _password,
            ),
            const SizedBox(height: 30.0),
            _CreateAccountButton(),
          ],
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  _SubmitButton({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  final String email, password;
  final AuthService _authService = FirebaseAuthService(
    authService: FirebaseAuth.instance,
  );
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          await _authService.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
          context.pushRoute(DashboardRoute());
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
            ),
          );
        }
      },
      child: const Text('Login'),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SignUpView(),
          ),
        );
      },
      child: const Text('Create Account'),
    );
  }
}
