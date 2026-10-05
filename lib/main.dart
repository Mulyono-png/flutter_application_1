import 'package:flutter_application_1/kalkulator.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Belajar Flutter GetX",
      initialRoute: Routes.registraion,
      getPages: Routes.myPages,
    );
  }
}