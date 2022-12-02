import 'package:admin_panel/ui/app/widgets/input_text.dart';
import 'package:admin_panel/ui/auth/login/view/login_view.dart';
import 'package:auth_service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpView();
}

class _SignUpView extends State<SignUpView> {
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
        title: const Text('Create Account'),
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
                hintText: 'Ej: nombre@gmail.com',
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
                hintText: 'Minimo 8 caracteres',
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
          await _authService.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => LoginView(),
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
            ),
          );
        }
      },
      child: const Text('Create Account'),
    );
  }
}
