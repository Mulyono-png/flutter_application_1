// ignore_for_file: constant_identifier_names

import 'package:flutter_application_1/pages/confirm_registration_page.dart';
import 'package:flutter_application_1/pages/deskripsi_makanan.dart';
import 'package:flutter_application_1/pages/list_makanan_page.dart';
import 'package:flutter_application_1/pages/registration_page.dart';
import 'package:flutter_application_1/pages/main_menu.dart';
import 'package:flutter_application_1/Login_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String login = "/login";
  static const String registraion = "/registraion";
  static const String confirm_registraion = "/confirm_registraion";
  static const String list_makanan = "/list_makanan";
  static const String deskripsi_makanan = "/deskripsi_makanan";
  static const String main_menu = "/main_menu";

  static final myPages = [
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: registraion, page: () => RegistrationPage()),
    GetPage(name: confirm_registraion, page: () => ConfirmRegistrationPage()),
    GetPage(name: list_makanan, page: () => ListMakananPage()),
    GetPage(name: deskripsi_makanan, page: () => DeskripsiMakananPage()),
    GetPage(name: main_menu, page: () => MainMenu()),
  ];
}
