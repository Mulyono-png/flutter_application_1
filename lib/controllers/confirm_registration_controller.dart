import 'package:get/get.dart';

class ConfirmRegistrationController extends GetxController {
  late String username;
  late String nama_lengkap;
  late String password;
  late String email;
  late String jenis_kelamin;
  late String nomorwa;
  late String agama;

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    if (arguments != null) {
      username = arguments["username"] ?? "";
      nama_lengkap = arguments["nama_lengkap"] ?? "";
      password = arguments["password"] ?? "";
      email = arguments["email"] ?? "";
      jenis_kelamin = arguments["jenis_kelamin"] ?? "";
      nomorwa = arguments["nomorwa"] ?? "";
      agama = arguments["agama"] ?? "";
    }
  }
}