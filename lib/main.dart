import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: KalkulatorSimpels()));

class KalkulatorSimpels extends StatefulWidget {
  const KalkulatorSimpels({super.key});

  @override
  State<KalkulatorSimpels> createState() => _KalkulatorSimpelsState();
}

class _KalkulatorSimpelsState extends State<KalkulatorSimpels> {
  final TextEditingController _txt1 = TextEditingController();
  final TextEditingController _txt2 = TextEditingController();
  String _hasil = "0";

  void _hitung(String op) {
    double a = double.tryParse(_txt1.text) ?? 0;
    double b = double.tryParse(_txt2.text) ?? 0;
    
    setState(() {
      if (op == "+") _hasil = "${a + b}";
      if (op == "-") _hasil = "${a - b}";
      if (op == "x") _hasil = "${a * b}";
      if (op == "÷") _hasil = b != 0 ? "${a / b}" : "Tidak bisa dibagi 0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kalkulator")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: _txt1, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "Angka Pertama")),
            TextField(controller: _txt2, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: "Angka Kedua")),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () => _hitung("+"), child: const Text("+")),
                ElevatedButton(onPressed: () => _hitung("-"), child: const Text("-")),
                ElevatedButton(onPressed: () => _hitung("x"), child: const Text("x")),
                ElevatedButton(onPressed: () => _hitung("÷"), child: const Text("÷")),
              ],
            ),
            const SizedBox(height: 30),
            Text("Hasil: $_hasil", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}