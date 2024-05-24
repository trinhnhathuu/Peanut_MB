import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:peanut_app/models/response/doctor_resopnse.dart';
import 'package:peanut_app/models/response/provinces_response.dart';
import 'package:peanut_app/pages/views/user/u_lich_hen/dang_ky_lich_hen/dang_ky_lich_he_controller.dart';
import 'package:peanut_app/utils/color_peanut.dart';
import 'package:peanut_app/utils/demensions.dart';
import 'package:peanut_app/utils/device_utils.dart';

import '../../../../../models/response/hospitals_response.dart';
import '../../../../basewidget/drop_down_custom.dart';
import '../../../../../utils/images.dart';
import '../../../../basewidget/text_field_custom.dart';

class UDangKyLichHenPage extends GetView<UDangKyLichHenController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder(
        init: UDangKyLichHenController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(
                title: const Text('Đặt Lịch Hẹn'),
                centerTitle: true,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                    })),
            body: Container(
              margin: EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///? chọn khách hàng
                    chonKhachHang(context),
                    _chonKhachHang(context),

                    ///? Thông tin khách hàng
                    Container(
                      child: Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Thông tin khách hàng',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: PDimensions.FONT_SIZE_H6)),
                          _thongTinKhachHang(context, controller),
                          SizedBox(
                              height:
                                  DeviceUtils.getScaledHeight(context, 0.02)),
                          Text('Giới Tính',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: PDimensions.FONT_SIZE_H6)),
                          _gioiTinh(context, controller: controller),
                        ],
                      ),
                    ),

                    ///? Thống tin lịch hẹn
                    Container(
                      child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Thông tin lịch hẹn',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: PDimensions.FONT_SIZE_H6)),
                            SizedBox(
                                height:
                                    DeviceUtils.getScaledHeight(context, 0.02)),
                            Text('Chọn khu vực',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: PDimensions.FONT_SIZE_H6)),
                            GestureDetector(
                              onTap: () {},
                              child: CustomDropdown<ProvinceResponse>(
                                height:
                                    DeviceUtils.getScaledHeight(context, 0.4),
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
                                items: controller.provinces,
                                selectedItem: controller.selectedProvince,
                                onChanged: (value) {
                                  controller.onchangeProvince(value!);
                                  controller.update();
                                },
                                itemBuilder: (hospital) =>
                                    Text(hospital.name!), // Custom item display
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: CustomDropdown<HospitalResponse>(
                                height:
                                    DeviceUtils.getScaledHeight(context, 0.4),
                                hintText: 'Chọn bệnh viện ',
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
                                  controller.update();
                                },
                                itemBuilder: (hospital) =>
                                    Text(hospital.name!), // Custom item display
                              ),
                            ),
                          ]),
                    ),
                    if (controller.selectedHospital != null &&
                        controller.hospitals!.isNotEmpty)
                      // Chon bac si
                      Container(
                        child: Flex(
                          direction: Axis.vertical,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Chọn bác sĩ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: PDimensions.FONT_SIZE_H6)),
                            GestureDetector(
                              onTap: () {},
                              child: CustomDropdown<DoctorResponse>(
                                height:
                                    DeviceUtils.getScaledHeight(context, 0.4),
                                hintText: 'Lựa chọn bác sĩ ',
                                hintTextStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: PDimensions.FONT_SIZE_SPAN,
                                ),
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: PDimensions.FONT_SIZE_SPAN,
                                ),
                                prefixIcon: Icons.location_on_outlined,
                                items: controller.doctors,
                                selectedItem: controller.selectedDoctor,
                                onChanged: (value) {
                                  controller.selectedDoctor = value!;
                                  controller.update();
                                },
                                itemBuilder: (doctor) => Text(
                                    doctor.fullName!), // Custom item display
                              ),
                            ),
                          ],
                        ),
                      ),

                    ///? Đặt lịch hẹn
                    Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Chọn ngày khám',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: PDimensions.FONT_SIZE_H6)),
                        CustomTextField(
                          controller: controller.ngayHenController,
                          readOnly: true,
                          onTap: () {
                            controller.showDatepicker(context,  controller.ngayHenController);
                            controller.update();
                          },
                          hintText: 'Chọn ngày khám',
                          prefixIcon: Icons.calendar_today,
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          hintStyle:
                              TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
                        ),
                      ],
                    ),

                    ///? Đặt lịch hẹn
                    Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Thời gian cụ thể',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: PDimensions.FONT_SIZE_H6)),
                        CustomTextField(
                          prefixIcon: Icons.access_time_rounded,
                          controller: controller.thoiGianCuTheController,
                          hintText: 'Thời gian cụ thể',
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          hintStyle:
                              TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
                          onTap: (){
                            controller.showTimePickerDialog(context, controller.thoiGianCuTheController);
                          },
                        ),
                      ],
                    ),

                    ///? Đặt lịch hẹn
                    Flex(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: Axis.vertical,
                      children: [
                        Text('Lý do thăm khám',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: PDimensions.FONT_SIZE_H6)),
                        CustomTextField(
                          controller: controller.lyDoThamKhamController,
                          hintText: 'Vui lòng ghi triệu chứng hoặc yêu cầu',
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          hintStyle:
                              TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
                        ),
                      ],
                    ),

                    ///?
                    GestureDetector(
                        onTap: () {
                          controller.dangKyLichHen();
                        },
                        child: Container(
                          margin:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorPeanut.BUTTON_DONGY,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: DeviceUtils.getScaledWidth(context, 0.9),
                          height: DeviceUtils.getScaledHeight(context, 0.06),
                          child: Text(
                            'Đặt lịch',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: PDimensions.FONT_SIZE_H4),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}

Widget chonKhachHang(BuildContext context) {
  return Container(
    width: DeviceUtils.getScaledWidth(context, 0.9),
    alignment: Alignment.center,
    child: Flex(
      direction: Axis.horizontal,
      children: [
        Image.asset(
          Images.icon_chon_nguoi_kham,
          height: DeviceUtils.getScaledHeight(context, 0.02),
          width: DeviceUtils.getScaledWidth(context, 0.03),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          'Chọn Khách Hàng',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: PDimensions.FONT_SIZE_H6),
        )
      ],
    ),
  );
}

Widget _chonKhachHang(BuildContext context) {
  return Container(
    child: Flex(
      direction: Axis.vertical,
      children: [
        Container(
          width: DeviceUtils.getScaledWidth(context, 0.1),
          height: DeviceUtils.getScaledWidth(context, 0.1),
          child: const CircleAvatar(
            backgroundImage: AssetImage(Images.anh_test),
          ),
        ),
        Text(
          'Tôi',
          style: TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
        ),
      ],
    ),
  );
}

Widget _thongTinKhachHang(
    BuildContext context, UDangKyLichHenController controller) {
  return Container(
    margin: EdgeInsets.only(
      left: PDimensions.SPACE_SIZE_5,
      right: PDimensions.SPACE_SIZE_5,
    ),
    child: Flex(direction: Axis.vertical, children: [
      CustomTextField(
        controller: controller.hovaTenController,
        hintText: 'Họ và Tên',
        prefixIcon: Icons.person_add_alt_1_outlined,
        hintStyle: TextStyle(
          fontSize: PDimensions.FONT_SIZE_SPAN,
        ),
      ),
      CustomTextField(
        readOnly: true,
        controller: controller.ngaySinhController,
        hintText: 'Ngày Sinh',
        prefixIcon: Icons.cake_outlined,
        onTap: () {
          controller.showDatepicker(context, controller.ngaySinhController);
        },
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        hintStyle: TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
      ),
      CustomTextField(
        keyboardType: TextInputType.phone,
        controller: controller.soDienThoaiController,
        hintText: 'Số điện thoại',
        prefixIcon: Icons.phone_outlined,
        hintStyle: TextStyle(fontSize: PDimensions.FONT_SIZE_SPAN),
      ),
    ]),
  );
}

// sử dụng choice trong flutter, màu xám khi chưa chọn, màu xanh khi đã chọn, bo tròn tầm 50.0
Widget _gioiTinh(BuildContext context,
    {required UDangKyLichHenController controller}) {
  return Container(
    width: DeviceUtils.getScaledWidth(context, 0.9),
    child: Flex(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      direction: Axis.horizontal,
      children: [
        ChoiceChip(
          showCheckmark: false,
          label: Text('Nam'),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20), // Điều chỉnh góc bo tròn tại đây
          ),
          selected: controller.isMale,
          selectedColor: Colors.green,
          onSelected: (bool selected) {
            controller.isMale = selected;
            print(controller.isMale);
            controller.update();
          },
        ),
        ChoiceChip(
          showCheckmark: false,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20), // Điều chỉnh góc bo tròn tại đây
          ),
          label: Text('Nữ'),
          selected: !controller.isMale,
          selectedColor: Colors.green,
          onSelected: (bool selected) {
            controller.isMale = !selected;
            print(controller.isMale);

            controller.update();
          },
        )
      ],
    ),
  );
}
