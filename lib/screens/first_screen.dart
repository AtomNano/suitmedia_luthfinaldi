// lib/screens/first_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/first_screen_controller.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirstScreenController controller = Get.put(FirstScreenController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon photo
                      Container(
                        width: 116,
                        height: 116,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/images/ic_photo.png',
                            width: 116,
                            height: 116,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Name field
                      TextField(
                        controller: controller.nameController,
                        decoration: const InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Palindrome field
                      TextField(
                        controller: controller.sentenceController,
                        decoration: const InputDecoration(
                          labelText: "Palindrome",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.checkPalindrome,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF255FA5),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text("CHECK"),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.goToNextScreen,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF255FA5),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text("NEXT"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
