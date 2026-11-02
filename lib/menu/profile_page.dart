import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0F12),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 48,
                        backgroundColor: Color(0xFF25282C),
                        child: Icon(
                          Icons.person,
                          size: 56,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'pandajawacuy',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Maling Asu  he/him',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF25282C),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text('Edit profile'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF25282C),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text('View archive'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 44),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF50545A)),
                          ),
                          child: const Icon(Icons.add, size: 38),
                        ),
                        const SizedBox(height: 8),
                        const Text('New'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
