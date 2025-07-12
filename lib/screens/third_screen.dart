// lib/screens/third_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/third_screen_controller.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThirdScreenController controller = Get.put(ThirdScreenController());

    return Scaffold(
      appBar: AppBar(title: const Text("Third Screen")),
      body: Obx(() {
        if (controller.isLoading.value && controller.userList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: controller.userList.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final user = controller.userList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.email),
                    onTap: () => controller.onUserSelected(user),
                  );
                },
              ),
            ),
            if (controller.currentPage <= controller.totalPages &&
                !controller.isLoading.value)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: ElevatedButton(
                  onPressed: () => controller.fetchUsers(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B637B),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Load Next Page'),
                ),
              ),
            if (controller.isLoading.value && controller.userList.isNotEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: CircularProgressIndicator(),
              ),
          ],
        );
      }),
    );
  }
}
