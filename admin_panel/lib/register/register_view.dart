import 'package:admin_panel/ui/constants/theme.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 5),
              child: Text(
                'Create Account',
                style: AppTextStyle.header,
              ),
            ),
            Text(
              'Enter your name, company, email and password to sign up',
              style: AppTextStyle.subHeader,
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter your name'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 15,
                left: 15,
                right: 15,
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Company',
                    hintText: 'Enter your company'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 15,
                left: 15,
                right: 15,
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 15,
                left: 15,
                right: 15,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                bottom: 15,
                left: 15,
                right: 15,
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Repeat password',
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
              //TODO: implementar logica register
              onPressed: () { },
              child: const Text(
                'Sign up',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
