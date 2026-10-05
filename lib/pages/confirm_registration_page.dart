import 'package:flutter_application_1/component/custom_button.dart';
import 'package:flutter_application_1/component/custom_text.dart';
import 'package:flutter_application_1/controllers/confirm_registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmRegistrationPage extends StatelessWidget {
  ConfirmRegistrationPage({super.key});

  final controller = Get.put(ConfirmRegistrationController());

  String _displayValue(String label, String value) {
    if (label == "Password") {
      return value.split('').map((_) => '•').join();
    }
    return value;
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            myText: label,
            fontSize: 13,
            myColor: Colors.grey.shade400,
          ),
          const SizedBox(height: 4),
          CustomText(
            myText: _displayValue(label, value),
            fontSize: 18,
            myColor: Colors.white,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = [
      ["Username", controller.username],
      ["Nama Lengkap", controller.nama_lengkap],
      ["Password", controller.password],
      ["Email", controller.email],
      ["Nomor WhatsApp", controller.nomorwa],
      ["Jenis Kelamin", controller.jenis_kelamin],
      ["Agama", controller.agama],
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const CustomText(
          myText: "Confirm Page",
          fontSize: 20,
          myColor: Colors.white,
        ),
        automaticallyImplyLeading: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 700;
          final leftColumn = data.sublist(0, (data.length / 2).ceil());
          final rightColumn = data.sublist((data.length / 2).ceil());

          final content = isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: leftColumn
                            .map((item) => _buildInfoRow(item[0], item[1]))
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: rightColumn
                            .map((item) => _buildInfoRow(item[0], item[1]))
                            .toList(),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data
                      .map((item) => _buildInfoRow(item[0], item[1]))
                      .toList(),
                );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.grey.shade700, width: 1.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.18),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    myText: "Data Pendaftaran",
                    fontSize: 22,
                    myColor: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  content,
                  const SizedBox(height: 24),
                  Center(
                    child: SizedBox(
                      width: 180,
                      child: CustomButton(
                        text: "ok",
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}