import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_app/models/response/hospitals_response.dart';
import 'package:peanut_app/pages/basewidget/drop_down_custom.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/demensions.dart';
import 'package:peanut_app/utils/device_utils.dart';
import '../../../../models/response/provinces_response.dart';
import '../../../basewidget/text_field_custom.dart';
import 'u_dang_ky_bac_si_controller.dart';

class DangKyBacSiPage extends GetView<DangKyBacSiController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DangKyBacSiController>(
      init: DangKyBacSiController(),
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
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
                CustomTextFieldWidget(
                  label: 'Họ và tên',
                  hint: 'Họ và tên',
                  controller: controller.hoTenController,
                ),
                const SizedBox(height: 20),
                CustomTextFieldWidget(
                  keyType: TextInputType.phone,
                  label: 'Số điện thoại',
                  hint: 'Số điện thoại',
                  controller: controller.soDienThoaiController,
                ),
                const SizedBox(height: 20),
                CustomTextFieldWidget(
                  keyType: TextInputType.emailAddress,
                  label: 'Email',
                  hint: 'Email',
                  controller: controller.emailController,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: CustomDropdown<ProvinceResponse>(
                    height: DeviceUtils.getScaledHeight(context, 0.4),
                    hintText: 'Chọn tỉnh thành phố',
                    hintTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: PDimensions.FONT_SIZE_SPAN,
                    ),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: PDimensions.FONT_SIZE_SPAN,
                    ),
                    prefixIcon: Icons.location_on_outlined,
                    items: controller.provinceList,
                    selectedItem: controller.selectedProvince,
                    onChanged: (value) {
                      controller.onchangeProvince(value!);
                      controller.update();
                    },
                    itemBuilder: (hospital) =>
                        Text(hospital.name!), // Custom item display
                  ),
                ),
                const SizedBox(height: 20),
                CustomDropdownWidget(
                  context: context,
                  controller: controller,
                ),
                const SizedBox(height: 20),
                CustomTextFieldWidget(
                  label: 'Khoa công tác',
                  hint: 'Khoa công tác',
                  controller: controller.khoaController,
                ),
                const SizedBox(height: 20),
                CustomTextFieldWidget(
                  label: 'Đường dẫn',
                  hint: 'Đường dẫn',
                  controller: controller.diaChiCuTheController,
                  onTap: controller.toManHinhBanDo,
                  readOnly: true,
                ),
                const SizedBox(height: 20),
                ImagePickerWidget(controller: controller),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    controller.dangKyBacSi();
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
}

class CustomTextFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final Function()? onTap;
  final bool readOnly;
  final TextInputType? keyType;

  const CustomTextFieldWidget({
    required this.label,
    required this.hint,
    this.controller,
    this.onTap,
    this.readOnly = false,
    this.keyType
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        CustomTextField(
          keyboardType: keyType ?? TextInputType.text,
          readOnly: readOnly,
          onTap: onTap,
          controller: controller,
          hintStyle: TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
          hintText: hint,
        ),
      ],
    );
  }
}

class CustomDropdownWidget extends StatelessWidget {
  final BuildContext context;
  final DangKyBacSiController controller;

  const CustomDropdownWidget({
    required this.context,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CustomDropdown<HospitalResponse>(
        height: DeviceUtils.getScaledHeight(context, 0.4),
        hintText: 'Chọn địa điểm công tác',
        hintTextStyle: TextStyle(
          color: Colors.black,
          fontSize: PDimensions.FONT_SIZE_SPAN,
        ),
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: PDimensions.FONT_SIZE_SPAN,
        ),
        prefixIcon: Icons.location_on_outlined,
        items: controller.hospitals,
        selectedItem: controller.selectedHospital,
        onChanged: (value) {
         controller.onChangeHospital(value!);
        },
        itemBuilder: (hospital) => Text(hospital.name!), // Custom item display
      ),
    );
  }
}

class ImagePickerWidget extends StatelessWidget {
  final DangKyBacSiController controller;

  const ImagePickerWidget({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: controller.getAnh,
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
