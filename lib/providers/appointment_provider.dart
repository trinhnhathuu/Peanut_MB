import 'package:get_it/get_it.dart';
import 'package:peanut_app/models/request/appointment_resquest.dart';
import 'package:peanut_app/models/response/ApiResponse.dart';
import 'package:peanut_app/models/response/appointment_response.dart';
import 'package:peanut_app/network/repository/appointment_repository.dart';

class AppointmentProvider {
  final appointmentRepository = GetIt.I.get<AppointmentRepository>();

  Future<void> create({
    required AppointmentRequest data,
    required Function(AppointmentRequest appointmentRequest) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    print(data.toJson());
    final ApiResponse apiResponse = await appointmentRepository.create(data);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(AppointmentRequest.fromJson(results as Map<String, dynamic>));
    } else {
      print(apiResponse.error);
      onError(apiResponse.error);
    }
  }

  Future<void> getAppointmentByUserId({
    required String id,
    required Function(List<AppointmentResponse> appointments) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse = await appointmentRepository.getByUserId(id);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as List<dynamic>;
      onSuccess(results
          .map((e) => AppointmentResponse.fromJson(e as Map<String, dynamic>))
          .toList());
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> getAppointmentByDoctorId({
    required String id,
    required Function(List<AppointmentResponse> appointments) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse =
        await appointmentRepository.getByDoctorId(id);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as List<dynamic>;
      onSuccess(results
          .map((e) => AppointmentResponse.fromJson(e as Map<String, dynamic>))
          .toList());
    } else {
      onError(apiResponse.error);
    }
  }

  Future<void> update({
    required String id,
    required AppointmentRequest data,
    required Function(AppointmentResponse appointment) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse =
        await appointmentRepository.update(id, data);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as dynamic;
      onSuccess(AppointmentResponse.fromJson(results as Map<String, dynamic>));
    } else {
      onError(apiResponse.error);
    }
  }


  Future<void> paginate({
    required String userId,
    required int page,
    required int limit,
    required Function(List<AppointmentResponse> appointments) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    final ApiResponse apiResponse = await appointmentRepository.paginate(
        userId: userId, page: page, limit: limit);
    if (apiResponse.response.statusCode! >= 200 &&
        apiResponse.response.statusCode! <= 300) {
      // call back data success
      final results = apiResponse.response.data as List<dynamic>;
      onSuccess(results
          .map((e) => AppointmentResponse.fromJson(e as Map<String, dynamic>))
          .toList());
    } else {
      onError(apiResponse.error);
    }
  }
}
