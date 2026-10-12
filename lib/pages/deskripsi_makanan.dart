import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/makanan_model.dart';
import 'package:get/get.dart';

class DeskripsiMakananPage extends StatelessWidget {
  const DeskripsiMakananPage({super.key});

  static const _green = Color(0xFF2E7D32);
  static const _lightGreen = Color(0xFFE8F5E9);

  @override
  Widget build(BuildContext context) {
    final makanan = Get.arguments as MakananModel;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F4),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: _green,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                makanan.namaMakanan,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(color: Colors.black54, blurRadius: 8)],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    makanan.gambar,
                    fit: BoxFit.cover,
                    frameBuilder: (context, child, frame, _) => frame == null
                        ? const Center(
                            child: CircularProgressIndicator(color: _green),
                          )
                        : child,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.restaurant, color: _green, size: 72),
                    ),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _priceAndRating(makanan),
                  const SizedBox(height: 22),
                  _section("Tentang menu", Text(makanan.deskripsi)),
                  _section(
                    "Bahan utama",
                    _infoBox(Icons.eco_outlined, makanan.bahanUtama),
                  ),
                  _section("Review pelanggan", _review(makanan)),
                  const SizedBox(height: 26),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: Get.back,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text("Kembali ke menu"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceAndRating(MakananModel makanan) => Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: _green.withValues(alpha: 0.08),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Harga", style: TextStyle(color: Colors.black54)),
              const SizedBox(height: 4),
              Text(
                "Rp ${makanan.harga}",
                style: const TextStyle(
                  color: _green,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        _rating(makanan.rating),
      ],
    ),
  );

  Widget _rating(String rating) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
      color: _lightGreen,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        const Icon(Icons.star_rounded, color: Color(0xFFFFC107), size: 20),
        const SizedBox(width: 5),
        Text(
          "$rating / 5",
          style: const TextStyle(color: _green, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );

  Widget _section(String title, Widget content) => Padding(
    padding: const EdgeInsets.only(top: 22),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color(0xFF202820),
          ),
        ),
        const SizedBox(height: 10),
        content,
      ],
    ),
  );

  Widget _infoBox(IconData icon, String text) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: _lightGreen,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: _green),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Color(0xFF315B35), height: 1.5),
          ),
        ),
      ],
    ),
  );

  Widget _review(MakananModel makanan) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: const Color(0xFFDDEBDD)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: _lightGreen,
              child: Icon(Icons.person, color: _green, size: 20),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                "Pelanggan",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const Icon(Icons.star_rounded, color: Color(0xFFFFC107), size: 18),
            const SizedBox(width: 3),
            Text(makanan.rating),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          makanan.review,
          style: const TextStyle(color: Color(0xFF424242), height: 1.6),
        ),
      ],
    ),
  );
}
