// lib/controllers/third_screen_controller.dart

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../models/user_model.dart';
import 'second_screen_controller.dart';
import '../services/api_service.dart'; // Import service yang baru dibuat

class ThirdScreenController extends GetxController {
  var userList = <User>[].obs;
  var isLoading = true.obs;
  var currentPage = 1;
  var totalPages = 1;

  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  final SecondScreenController _secondScreenController = Get.find();

  @override
  void onInit() {
    super.onInit();
    fetchUsers(); // Load data sekali saja saat init
  }

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      userList.clear();
      isLoading.value = true;
    } else {
      // Stop fetch jika sudah sampai halaman terakhir
      if (currentPage > totalPages) {
        refreshController.loadNoData();
        return;
      }
    }
    try {
      final result = await ApiService.fetchUsersWithMeta(currentPage);
      List<User> newUsers = result['users'];
      totalPages = result['totalPages'];

      if (newUsers.isNotEmpty) {
        userList.addAll(newUsers);
        currentPage++;
      }

      if (isRefresh) {
        refreshController.refreshCompleted();
      } else {
        if (currentPage > totalPages) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      }
    } catch (e) {
      if (isRefresh) {
        refreshController.refreshFailed();
      } else {
        refreshController.loadFailed();
      }
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void onLoading() {
    // Stop fetch jika sudah sampai halaman terakhir
    if (currentPage > totalPages) {
      refreshController.loadNoData();
      return;
    }
    fetchUsers();
  }

  void onRefresh() {
    fetchUsers(isRefresh: true);
  }

  void onUserSelected(User user) {
    _secondScreenController.updateSelectedUser(
      '${user.firstName} ${user.lastName}',
    );
    Get.back(); // Kembali ke layar kedua
  }
}
