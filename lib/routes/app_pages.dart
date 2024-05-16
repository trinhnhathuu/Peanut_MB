import 'package:get/get.dart';
import 'package:peanut_app/pages/views/login/login_page.dart';
import 'package:peanut_app/pages/views/user/u_dang_bai/u_dang_bai_page.dart';
import 'package:peanut_app/pages/views/user/u_home/chi_tiet_bai_viet/chi_tiet_bai_viet_page.dart';
import 'package:peanut_app/pages/views/user/u_lich_hen/dang_ky_lich_hen/dang_ky_lich_hen_page.dart';
import 'package:peanut_app/pages/views/user/u_lich_hen/lich_hen/chi_tiet_lich_hen/chi_tiet_lich_hen_page.dart';
import 'package:peanut_app/pages/views/user/u_lich_hen/u_lich_hen.dart';
import 'package:peanut_app/routes/app_routes.dart';

import '../pages/basewidget/googleMap/chon_vi_tri_page.dart';
import '../pages/views/account/u_dang_ky_bac_si/u_dang_ky_bac_si_page.dart';
import '../pages/views/account/u_thong_tin_ca_nhan/chinh_sua_thong_tin/chinh_sua_thong_tin_ca_nhan_page.dart';
import '../pages/views/account/u_thong_tin_ca_nhan/thong_tin_ca_nhan_page.dart';
import '../pages/views/doctor/d_dashboad/d_dash_boad_page.dart';
import '../pages/views/doctor/d_lich_hen/d_danh_sach_lich_hen/d_chi_tiet_lich_hen/d_chi_tiet_lich_hen_page.dart';
import '../pages/views/user/dashboard/user_dashboard.dart';
import '../pages/views/user/u_home/u_home_page.dart';
import '../pages/views/user/u_thai_ki/u_form_dang_ky/u_dang_ky_thai_ky_page.dart';
import '../pages/views/user/u_thai_ki/u_thai_ki_page.dart';

class AppPages{
  static List<GetPage> list = [
    GetPage(
      name:AppRoutes.LOGIN,
      page:()=>LoginPage(),
    ),
    GetPage(
      name:AppRoutes.U_DASHBOARD,
      page:()=>DashBoardUserPage(),
    ),
    GetPage(
      name:AppRoutes.U_HOME,
      page:()=>UHomePage(),
    ),
    GetPage(
      name:AppRoutes.U_CHI_TIET_BAI_VIET,
      page:()=>ChiTietBaiVietPage(),
    ),
    GetPage(
      name:AppRoutes.U_DANG_KY_THAI_KY_FORM,
      page:()=>DangKyThaiKyFormPage(),
    ),
    GetPage(
      name:AppRoutes.U_THAI_KY,
      page:()=>ThaiKyPage(),
    ),
    GetPage(
      name:AppRoutes.U_DANG_BAI,
      page:()=>UBaiDangPage(),
    ),
    GetPage(
      name:AppRoutes.U_LICH_HEN,
      page:()=>ULichHenPage(),
    ),
    GetPage(
      name:AppRoutes.U_DANG_KY_LICH_HEN,
      page:()=>UDangKyLichHenPage(),
    ),
    GetPage(
      name:AppRoutes.U_CHI_TIET_LICH_HEN,
      page:()=>ChiTietLichHenPage(),
    ),

    GetPage(
      name:AppRoutes.THONG_TIN_CA_NHAN,
      page:()=>ThongTinCaNhanPage(),
    ),
    GetPage(
      name:AppRoutes.CHINH_SUA_THONG_TIN_CA_NHAN,
      page:()=>ChinhSuaThongTinCaNhanPage(),
    ),
     GetPage(
      name:AppRoutes.DANG_KY_BAC_SI,
      page:()=>DangKyBacSiPage(),
    ),

    /// bác sĩ
    /// 
      GetPage(
      name:AppRoutes.D_DASHBOARD,
      page:()=>DDashBoardPage(),
    ),
    GetPage(
      name:AppRoutes.D_CHI_TIET_LICH_HEN,
      page:()=>DChiTietLichHenPage(),
    ),
      GetPage(
      name:AppRoutes.MAN_HINH_BAN_DO,
      page:()=>ChonViTriPage(),
    ),
  ];
}