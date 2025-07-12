// lib/controllers/first_screen_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/second_screen.dart';

class FirstScreenController extends GetxController {
  final nameController = TextEditingController();
  final sentenceController = TextEditingController();

  // Fungsi untuk memeriksa palindrome
  void checkPalindrome() {
    String original = sentenceController.text.replaceAll(' ', '').toLowerCase();
    String reversed = original.split('').reversed.join('');

    Get.defaultDialog(
      title: "Palindrome Check",
      middleText: original == reversed ? "isPalindrome" : "not palindrome",
    );
  }

  // Fungsi untuk pindah ke layar kedua
  void goToNextScreen() {
    if (nameController.text.isNotEmpty) {
      Get.to(() => SecondScreen(), arguments: nameController.text);
    } else {
      Get.snackbar(
        "Error",
        "Please input your name",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    sentenceController.dispose();
    super.onClose();
  }
}