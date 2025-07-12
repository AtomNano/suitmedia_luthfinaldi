// lib/screens/second_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/second_screen_controller.dart';
import 'third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String nameFromFirstScreen = Get.arguments;
    final SecondScreenController controller = Get.put(SecondScreenController());

    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              nameFromFirstScreen,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Spacer(), // Mendorong konten ke tengah dan bawah
            Center(
              // Menggunakan Obx untuk membuat widget reaktif
              child: Obx(() => Text(
                controller.selectedUserName.value,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              )),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => ThirdScreen()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B637B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Choose a User"),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}