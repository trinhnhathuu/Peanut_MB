import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UDangKyLichHenController extends GetxController {
  bool isLoading = false;
  bool isMale = false;

  List<String> provinces = [
    'Hà Nội',
    'Hồ Chí Minh',
    'Hải Phòng',
    'Đà Nẵng',
    'Cần Thơ',
    'Hà Giang',
    'Cao Bằng',
    'Lai Châu',
    'Lào Cai',
    'Tuyên Quang',
    'Lạng Sơn',
    'Bắc Kạn',
    'Thái Nguyên',
    'Yên Bái',
    'Sơn La',
    'Phú Thọ',
    'Vĩnh Phúc',
    'Bắc Giang',
    'Quảng Ninh',
    'Bắc Ninh',
    'Hải Dương',
    'Hưng Yên',
    'Thái Bình',
    'Hà Nam',
    'Nam Định',
    'Ninh Bình',
    'Thanh Hóa',
    'Nghệ An',
    'Hà Tĩnh',
    'Quảng Bình',
    'Quảng Trị',
    'Thừa Thiên Huế',
    'Quảng Nam',
    'Quảng Ngãi',
    'Bình Định',
    'Phú Yên',
    'Khánh Hòa',
    'Ninh Thuận',
    'Bình Thuận',
    'Kon Tum',
    'Gia Lai',
    'Đắk Lắk',
    'Đắk Nông',
    'Lâm Đồng',
    'Bình Phước',
    'Tây Ninh',
    'Bình Dương',
    'Đồng Nai',
    'Bà Rịa - Vũng Tàu',
    'Long An',
    'Tiền Giang',
    'Bến Tre',
    'Trà Vinh',
    'Vĩnh Long',
  ];

// list những bệnh viện nổi tiếng ở việt nam
  final List<String> famousHospitalsInVietnam = [
    'Bệnh viện Bạch Mai - Hà Nội',
    'Bệnh viện Chợ Rẫy - TP. Hồ Chí Minh',
    'Bệnh viện 108 - Hà Nội',
    'Bệnh viện Đại học Y Hà Nội',
    'Bệnh viện Nhi Trung ương - Hà Nội',
    'Bệnh viện Nhi Đồng 1 - TP. Hồ Chí Minh',
    'Bệnh viện Nhi Đồng 2 - TP. Hồ Chí Minh',
    'Bệnh viện Việt Đức - Hà Nội',
    'Bệnh viện Xanh Pôn - Đà Nẵng',
    'Bệnh viện Đa Khoa Tỉnh Đồng Nai',
    'Bệnh viện Đa Khoa Tỉnh Bà Rịa - Vũng Tàu',
    'Bệnh viện Trung Ương Quân Đội 108 - Hà Nội',
    'Bệnh viện Trung Ương Huế',
    'Bệnh viện Trung Ương Cần Thơ',
    'Bệnh viện Trung Ương Đà Nẵng',
    'Bệnh viện Ung Bướu TP.HCM',
    'Bệnh viện Nhiệt đới TP.HCM',
    'Bệnh viện Từ Dũ - TP.HCM',
    'Bệnh viện Nhân dân Gia Định - TP.HCM',
    'Bệnh viện Quốc tế Vinmec - Hà Nội',
  ];
  List<String> doctors = [
    "Dr. John Doe",
    "Dr. Jane Smith",
    "Dr. David Johnson",
  ];
  String? selectedHospital = '';
  String? selectedDoctor = '';
  String? selectedTinhThanhPho = '';
  TextEditingController ngayHenController = TextEditingController();
  TextEditingController thoiGianCuTheController = TextEditingController();
  TextEditingController lyDoThamKhamController = TextEditingController();

  // viết hàm showDatepicker và gán giá trị cho ngayHenController

  void showDatepicker(BuildContext context) {
    showDatePicker(
    // local việt nam
      locale: Locale('vi', 'VN'),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((value) {
      ngayHenController.text = DateFormat('dd/MM/yyyy').format(value!);
      update();
    });
  }
}
