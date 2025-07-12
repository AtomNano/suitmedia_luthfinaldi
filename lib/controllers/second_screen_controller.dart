// lib/controllers/second_screen_controller.dart

import 'package:get/get.dart';

class SecondScreenController extends GetxController {
  // .obs membuat variabel ini reaktif
  var selectedUserName = 'Selected User Name'.obs;

  void updateSelectedUser(String name) {
    selectedUserName.value = name;
  }
}