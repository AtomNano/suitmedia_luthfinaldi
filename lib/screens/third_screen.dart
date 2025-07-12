// lib/screens/third_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
        return SmartRefresher(
          controller: controller.refreshController,
          enablePullUp: true,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoading,
          header: const WaterDropHeader(),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus? mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = const Text("pull up load");
              } else if (mode == LoadStatus.loading) {
                body = const CircularProgressIndicator();
              } else if (mode == LoadStatus.failed) {
                body = const Text("Load Failed!Click retry!");
              } else if (mode == LoadStatus.canLoading) {
                body = const Text("release to load more");
              } else {
                body = const Text("No more Data");
              }
              return SizedBox(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
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
        );
      }),
    );
  }
}