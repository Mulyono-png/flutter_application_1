import 'package:get/get.dart';

class KalkulatorController extends GetxController {
  var hasilHitung = 0.0.obs;

  void tambah(double angka1, double angka2) {
    double hasilTambah = angka1 + angka2;
    hasilHitung.value = hasilTambah;

    Get.snackbar(
      "Hasil Jumlah",
      hasilTambah.toString(),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void kurang(double angka1, double angka2) {
    double hasilKurang = angka1 - angka2;
    hasilHitung.value = hasilKurang;

    Get.snackbar(
      "Hasil Kurang",
      hasilKurang.toString(),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void kali(double angka1, double angka2) {
    double hasilKali = angka1 * angka2;
    hasilHitung.value = hasilKali;

    Get.snackbar(
      "Hasil Kali",
      hasilKali.toString(),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void bagi(double angka1, double angka2) {
    if (angka2 == 0) {
      Get.snackbar(
        "Peringatan",
        "Angka 2 tidak boleh 0",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    double hasilBagi = angka1 / angka2;
    hasilHitung.value = hasilBagi;

    Get.snackbar(
      "Hasil Bagi",
      hasilBagi.toString(),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}