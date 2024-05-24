import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/appointment_resquest.dart';
import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/network/dio/dio_cleint.dart';

class AppointmentRepository {
  DioClient? dioClient = GetIt.I.get<DioClient>();
  AppointmentRepository();

  Future<ApiResponse> create(AppointmentRequest appointmentRequest) async {
    try {
      final response =
          await dioClient!.post('/appointment', data: appointmentRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> getByUserId(String id) async {
    try {
      final response =
          await dioClient!.get('/appointment/user/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  Future<ApiResponse> getByDoctorId(String id) async {
    try {
      final response =
          await dioClient!.get('/appointment/doctor/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
   Future<ApiResponse> update(String id, AppointmentRequest appointmentRequest) async {
    try {
      final response =
          await dioClient!.put('/appointment/$id', data: appointmentRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }

  // paginate 
  Future<ApiResponse> paginate({
    required String userId,
   required int page,required int limit
  }
    ) async {
    try {
      final response =
          await dioClient!.get('/appointment/user/$userId/appointments/?page=$page&limit=$limit');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }
}
