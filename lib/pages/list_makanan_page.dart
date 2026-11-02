import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/list_makanan_controller.dart';
import 'package:flutter_application_1/models/makanan_model.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:get/get.dart';

class ListMakananPage extends StatelessWidget {
  ListMakananPage({super.key});

  static const _background = Color(0xFFF9F6F0);
  static const _paper = Color(0xFFFFFDF8);
  static const _mustard = Color(0xFFE5A93B);
  static const _coffee = Color(0xFF4A3B32);
  static const _terracotta = Color(0xFF9E472A);
  static const _secondaryText = Color(0xFF6F6258);
  static const _placeholder = Color(0xFFEDE5D8);

  final _controller = Get.put(ListMakananController());

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: _background,
    appBar: AppBar(
      title: const Text(
        "Menu Makanan",
        style: TextStyle(fontFamily: "serif", fontWeight: FontWeight.bold),
      ),
      backgroundColor: _mustard,
      foregroundColor: _coffee,
      elevation: 0,
    ),
    body: ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _controller.dataMakanan.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          bottom: index == _controller.dataMakanan.length - 1 ? 0 : 14,
        ),
        child: _menuItem(_controller.dataMakanan[index]),
      ),
    ),
  );

  Widget _menuItem(MakananModel makanan) => Card(
    color: _paper,
    elevation: 2,
    shadowColor: _coffee.withValues(alpha: 0.12),
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    clipBehavior: Clip.antiAlias,
    child: InkWell(
      onTap: () => Get.toNamed(Routes.deskripsi_makanan, arguments: makanan),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _menuImage(makanan.gambar),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    makanan.namaMakanan,
                    style: const TextStyle(
                      fontFamily: "serif",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _coffee,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: _mustard, size: 18),
                      const SizedBox(width: 4),
                      Text(
                        makanan.rating,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: _secondaryText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    makanan.deskripsi,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: _secondaryText,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    "Rp ${makanan.harga}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _terracotta,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _menuImage(String imageUrl) => ClipRRect(
    borderRadius: BorderRadius.circular(14),
    child: Image.network(
      imageUrl,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const SizedBox(
          width: 100,
          height: 100,
          child: Center(
            child: CircularProgressIndicator(strokeWidth: 2, color: _mustard),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => const SizedBox(
        width: 100,
        height: 100,
        child: ColoredBox(
          color: _placeholder,
          child: Icon(Icons.restaurant, color: _terracotta, size: 36),
        ),
      ),
    ),
  );
}
