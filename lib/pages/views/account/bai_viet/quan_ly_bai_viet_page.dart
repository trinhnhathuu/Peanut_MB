

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/pages/views/account/bai_viet/quan_ly_bai_viet_controller.dart';

class QuanLyBaiVietPage extends GetView<QuanLyBaiVietController>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuanLyBaiVietController>(
      init: QuanLyBaiVietController(),
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Quản lý bài viết'),
          ),
          body:
 controller.listPoster.isEmpty
              ? const Center(
                  child: Text('Chúa co bài viết'),
                )
              : ListView.builder(
                  itemCount: controller.listPoster.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.listPoster[index].title.toString()),
                      subtitle: Text(controller.listPoster[index].content.toString()),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          controller.deletePoster(id: controller.listPoster[index].id.toString());
                        },
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}

