// ignore_for_file: constant_identifier_names

import 'package:flutter_application_1/pages/confirm_registration_page.dart';
import 'package:flutter_application_1/pages/registration_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String registraion = "/registraion";
  static const String confirm_registraion = "/confirm_registraion";
  // dll

  // kita masukkan ke dalam myPages array
  static final myPages = [
    GetPage(name: registraion, page: () => RegistrationPage()),
    GetPage(name: confirm_registraion, page: () => ConfirmRegistrationPage()),
    // dll
  ];
}