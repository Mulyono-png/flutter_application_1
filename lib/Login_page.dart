import 'package:flutter/material.dart';
import 'component/custom_button.dart';
import 'component/custom_text.dart';
import 'component/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  String statusLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomText(
              text: "Welcome to application " + statusLogin,
              fontSize: 22,
              color: const Color.fromARGB(255, 46, 9, 182),
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              hint: "input username",
              txtController: txtUsername,
            ),
            const SizedBox(height: 10),

            CustomTextField(
              hint: "input password",
              txtController: txtPassword,
              isPassword: true,
            ),
            const SizedBox(height: 20),

            CustomButton(
              text: "Login",
              onPressed: () {
                setState(() {
                  String username = txtUsername.text;
                  String password = txtPassword.text;
                  if (username == "admin" && password == "admin") {
                    statusLogin = "admin";
                  } else {
                    statusLogin = "failed";
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}