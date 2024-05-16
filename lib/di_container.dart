import 'package:get_it/get_it.dart';
import 'package:peanut_app/network/repository/doctor_signup_repository.dart';
import 'package:peanut_app/network/repository/hospital_repository.dart';
import 'package:peanut_app/network/repository/poster_repository.dart';
import 'package:peanut_app/network/repository/provinces_repository.dart';
import 'package:peanut_app/network/repository/tai_khoan_repository.dart';
import 'package:peanut_app/providers/doctor_signup_provider.dart';
import 'package:peanut_app/providers/hospital_provider.dart';
import 'package:peanut_app/providers/poster_provider.dart';
import 'package:peanut_app/providers/province_provider.dart';
import 'package:peanut_app/providers/tai_khoan_provider.dart';
import 'package:peanut_app/sharedpref/shared_preference_helper.dart';
import 'package:peanut_app/utils/size.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network/dio/dio_cleint.dart';
import 'network/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferenceHelper>(
      SharedPreferenceHelper(sharedPreferences));
  sl.registerSingleton<PSize>(PSize());
  sl.registerSingleton<LoggingInterceptor>(LoggingInterceptor());
  sl.registerSingleton<DioClient>(DioClient());
  sl.registerLazySingleton(() => TaiKhoanRepository());
  sl.registerLazySingleton(() => TaiKhoanProvider());
  sl.registerLazySingleton(() => PosterRepository());
  sl.registerLazySingleton(() => PosterProvider());
  sl.registerLazySingleton(() => DoctorSignUpRepository());
  sl.registerLazySingleton(() => DoctorSignUpProvider());

  sl.registerLazySingleton(() => ProvinceProvider());
  sl.registerLazySingleton(() => ProvincesRepository());

  sl.registerLazySingleton(() => HospitalProvider());
  sl.registerLazySingleton(() => HospitalRepository());
}
