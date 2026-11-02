import 'package:flutter_application_1/models/makanan_model.dart';
import 'package:get/get.dart';

class DetailMakananController extends GetxController {
  MakananModel? makanan;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments is MakananModel) {
      makanan = arguments;
    }
  }
}