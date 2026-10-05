import 'package:flutter_application_1/component/custom_textfield.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/controllers/registration_controller.dart';
import 'package:flutter_application_1/component/custom_text.dart';
import 'package:flutter_application_1/component/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());

    TextEditingController txtUsername = TextEditingController();
    TextEditingController txtNamaLengkap = TextEditingController();
    TextEditingController txtPassword = TextEditingController();
    TextEditingController txtEmail = TextEditingController();
    TextEditingController txtnowa = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const CustomText(
          myText: "Registration",
          myColor: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextfield(
                  myHint: "input username",
                  txtController: txtUsername,
                  icon: Icons.person_outline,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextfield(
                  myHint: "input nama lengkap",
                  txtController: txtNamaLengkap,
                  icon: Icons.badge_outlined,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextfield(
                  myHint: "input password",
                  txtController: txtPassword,
                  isPassword: true,
                  icon: Icons.lock_outline,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextfield(
                  myHint: "input email",
                  txtController: txtEmail,
                  icon: Icons.email_outlined,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextfield(
                  myHint: "input nomor whatsapp",
                  txtController: txtnowa,
                  isNumeric: true,
                  icon: Icons.phone_android_outlined,
                ),
              ),
              // Dropdown untuk Jenis Kelamin
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.redAccent.withOpacity(0.3),
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      value: controller.selectedJenisKelamin.value,
                      dropdownColor: Colors.grey.shade900,
                      style: const TextStyle(color: Colors.white),
                      iconEnabledColor: const Color(0xFFFF5252),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      hint: const Text(
                        "Pilih Jenis Kelamin",
                        style: TextStyle(color: Color(0xFFA0A0A0)),
                      ),
                      items: controller.listJenisKelamin
                          .map(
                            (jenis) => DropdownMenuItem<String>(
                              value: jenis,
                              child: Text(
                                jenis,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.selectedJenisKelamin.value = newValue;
                        }
                      },
                    ),
                  ),
                ),
              ),
              // Dropdown untuk Agama
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.redAccent.withOpacity(0.3),
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      value: controller.selectedAgama.value,
                      dropdownColor: Colors.grey.shade900,
                      style: const TextStyle(color: Colors.white),
                      iconEnabledColor: const Color(0xFFFF5252),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      hint: const Text(
                        "Pilih Agama",
                        style: TextStyle(color: Color(0xFFA0A0A0)),
                      ),
                      items: controller.listAgama
                          .map(
                            (agama) => DropdownMenuItem<String>(
                              value: agama,
                              child: Text(
                                agama,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          controller.selectedAgama.value = newValue;
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: "Send",
                onPressed: () {
                  // pindah dan mengirim data registrasi ke confirm page
                  Get.toNamed(
                    Routes.confirm_registraion,
                    arguments: {
                      "username": txtUsername.text,
                      "nama_lengkap": txtNamaLengkap.text,
                      "password": txtPassword.text,
                      "email": txtEmail.text,
                      "jenis_kelamin": controller.jenisKelamin,
                      "nomorwa": txtnowa.text,
                      "agama": controller.selectedAgama.value,
                      //dll
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}