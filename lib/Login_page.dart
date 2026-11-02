import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/custom_textfield.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();
  String statusLogin = '';
  bool? loginSuccess;
  bool isLoading = false;

  @override
  void dispose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.dispose();
  }

  Future<void> login() async {
    final username = txtUsername.text.trim();
    final password = txtPassword.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        statusLogin = 'Username dan password harus diisi';
        loginSuccess = false;
      });
      return;
    }

    setState(() {
      isLoading = true;
      statusLogin = '';
      loginSuccess = null;
    });

    late String message;
    late bool isSuccess;

    try {
      final response = await http
          .post(
            Uri.parse('https://mediadwi.com/api/latihan/login'),
            body: {'username': username, 'password': password},
          )
          .timeout(const Duration(seconds: 15));

      if (response.statusCode != 200) {
        message = 'Server error (${response.statusCode})';
        isSuccess = false;
      } else {
        final data = jsonDecode(response.body);
        if (data is! Map<String, dynamic> || data['status'] is! bool) {
          throw const FormatException('Format response API tidak sesuai');
        }

        isSuccess = data['status'] as bool;
        message = data['message'] is String
            ? data['message'] as String
            : (isSuccess ? 'Login success' : 'Login gagal');
      }
    } on TimeoutException {
      message = 'Koneksi timeout. Coba lagi.';
      isSuccess = false;
    } on http.ClientException {
      message = 'Tidak dapat terhubung ke server.';
      isSuccess = false;
    } on FormatException {
      message = 'Response server tidak valid.';
      isSuccess = false;
    }

    if (!mounted) return;
    setState(() {
      statusLogin = message;
      loginSuccess = isSuccess;
      isLoading = false;
    });

    if (isSuccess) {
      Get.offAllNamed(Routes.main_menu);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              statusLogin.isEmpty ? 'Welcome to application' : statusLogin,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: statusLogin.isEmpty
                    ? Colors.blue
                    : loginSuccess == true
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            CustomTextfield(
              myHint: 'input username',
              txtController: txtUsername,
            ),
            const SizedBox(height: 12),
            CustomTextfield(
              myHint: 'input password',
              txtController: txtPassword,
              isPassword: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : login,
              child: isLoading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
