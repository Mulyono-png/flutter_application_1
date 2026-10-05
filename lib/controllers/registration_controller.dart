import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final selectedJenisKelamin = 'Laki-Laki'.obs;
  final selectedAgama = 'Islam'.obs;

  final listJenisKelamin = ['Laki-Laki', 'Perempuan'];
  final listAgama = [
    'Islam',
    'Kristen',
    'Katolik',
    'Hindu',
    'Buddha',
    'Konghucu',
  ];

  String get jenisKelamin => selectedJenisKelamin.value;
}