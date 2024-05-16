import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/demensions.dart';
import 'package:peanut_app/utils/device_utils.dart';
import '../../../basewidget/text_field_custom.dart';
import 'u_dang_ky_bac_si_controller.dart';

class DangKyBacSiPage extends GetView<DangKyBacSiController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DangKyBacSiController(),
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            title: const Text('Đăng ký bác sĩ'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextField('Họ và tên', 'Họ và tên',
                    controller: controller.hoTenController, onTap: () {}),
                const SizedBox(height: 20),
                buildTextField('Số điện thoại', 'Số điện thoại',
                    controller: controller.soDienThoaiController, onTap: () {}),
                const SizedBox(height: 20),
                buildTextField('Email', 'Email',
                    controller: controller.emailController, onTap: () {}),
                const SizedBox(height: 20),
                buildTextField('Bệnh viện, phòng khám làm việc',
                    'Bệnh viện, phòng khám làm việc',
                    controller: controller.benhVienController, onTap: () {}),
                const SizedBox(height: 20),
                buildTextField('Khoa công tác', 'Khoa công tác',
                    controller: controller.khoaController, onTap: () {}),
                const SizedBox(height: 20),
                buildTextField('Đường dẫn', 'Đường dẫn',
                    controller: controller.diaChiCuTheController, onTap: () {
                  controller.toManHinhBanDo();
                }, readOnly: true),
                const SizedBox(height: 20),
                buildImagePicker(controller),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện đăng ký
                    controller.dangKyBacSi();
                    controller.update();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPeanut.BUTTON_DONGY,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    width: DeviceUtils.getScaledWidth(context, 0.8),
                    height: DeviceUtils.getScaledHeight(context, 0.07),
                    child: const Text('Đăng ký'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTextField(String label, String hint,
      {TextEditingController? controller,
      Function()? onTap,
      bool? readOnly = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        CustomTextField(
          readOnly: readOnly ?? false,
          onTap: () {
            onTap!();
          },
          controller: controller,
          hintStyle: TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
          hintText: hint,
        ),
      ],
    );
  }

  Widget buildImagePicker(DangKyBacSiController controller) {
    return Obx(() => GestureDetector(
          onTap: () {
            controller.getAnh();
          },
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Center(
              child: controller.imageUrl.isEmpty
                  ? const Icon(Icons.add, size: 40)
                  : Image.network(controller.imageUrl.value.toString()),
            ),
          ),
        ));
  }
}
