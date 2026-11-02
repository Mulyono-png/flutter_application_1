import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/detail_makanan_controller.dart';
import 'package:flutter_application_1/models/makanan_model.dart';
import 'package:get/get.dart';

class DeskripsiMakananPage extends StatelessWidget {
  DeskripsiMakananPage({super.key});

  static const _background = Color.fromARGB(255, 247, 244, 237);
  static const _mustard = Color.fromARGB(255, 225, 167, 58);
  static const _coffee = Color.fromARGB(255, 74, 59, 50);
  static const _terracotta = Color.fromARGB(255, 155, 70, 41);
  static const _secondaryText = Color.fromARGB(255, 114, 101, 91);

  final _controller = Get.put(DetailMakananController());

  @override
  Widget build(BuildContext context) {
    final makanan = _controller.makanan;
    if (makanan == null) {
      return Scaffold(
        backgroundColor: _background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Menu tidak ditemukan."),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Get.offAllNamed("/list_makanan"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _terracotta,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Kembali ke menu"),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: _background,
      appBar: AppBar(
        title: Text(
          makanan.namaMakanan,
          style: const TextStyle(fontFamily: "serif"),
        ),
        backgroundColor: _mustard,
        foregroundColor: _coffee,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _foodImage(makanan.gambar),
            const SizedBox(height: 20),
            Text(
              makanan.namaMakanan,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "serif",
                color: _coffee,
              ),
            ),
            const SizedBox(height: 12),
            _priceAndRating(makanan),
            _section("Review:", makanan.review),
            _section("Deskripsi:", makanan.deskripsi),
          ],
        ),
      ),
    );
  }

  Widget _foodImage(String imageUrl) => ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.network(
      imageUrl,
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const SizedBox(
          width: double.infinity,
          height: 200,
          child: Center(
            child: CircularProgressIndicator(color: _mustard),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => const SizedBox(
        width: double.infinity,
        height: 200,
        child: ColoredBox(
          color: _mustard,
          child: Icon(Icons.restaurant, color: _terracotta, size: 48),
        ),
      ),
    ),
  );

  Widget _priceAndRating(MakananModel makanan) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Harga: Rp ${makanan.harga}",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 6),
      Text("Rating: ${makanan.rating} / 5"),
    ],
  );

  Widget _section(String title, String content) => Padding(
    padding: const EdgeInsets.only(top: 28),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "serif",
            color: _coffee,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: const TextStyle(color: _secondaryText, height: 1.6),
        ),
      ],
    ),
  );
}
