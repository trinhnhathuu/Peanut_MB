
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:peanut_app/network/dio/logging_interceptor.dart';
import '../../sharedpref/shared_preference_helper.dart';
import '../../utils/app_constants.dart';

class DioClient {
  GetIt sl = GetIt.instance;
  Dio? dio;

  String? token;

  LoggingInterceptor? loggingInterceptor;

  DioClient() {
    _init();
  }

  Future<void> _init() async {
    await sl.get<SharedPreferenceHelper>().jwtToken.then((token) async {
      dio = Dio();
      dio!
        ..options.connectTimeout = Duration(milliseconds: 60 * 1000)
        ..options.receiveTimeout = Duration(milliseconds: 60 * 1000)
        ..httpClientAdapter
        ..options.headers = {
          'Content-Type': 'application/json; charset=UTF-8',
        };
      dio!.interceptors.add(
        sl.get<LoggingInterceptor>(),
      );
    });
  }

  Future<void> resetInit() async {
    await sl.get<SharedPreferenceHelper>().jwtToken.then((token) {
      dio = Dio();
      dio!
        ..options.baseUrl = BASE_URL
        ..options.connectTimeout = (60 * 1000) as Duration?
        ..options.receiveTimeout = (60 * 1000) as Duration?
        ..httpClientAdapter
        ..options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};
      dio!.interceptors.add(sl.get<LoggingInterceptor>());
    });
  }

  ///
  /// lam moi dio
  ///
  Future<void> refreshToken() async {
    await sl.get<SharedPreferenceHelper>().jwtToken.then((token) {
      dio = Dio();
      dio!
        // ..options.baseUrl = app_constants.BASE_URL
        ..options.connectTimeout = (60 * 1000) as Duration?
        ..options.receiveTimeout = (60 * 1000) as Duration?
        ..httpClientAdapter
        ..options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};

      dio!.interceptors.add(sl.get<LoggingInterceptor>());
    });
  }


  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      options ??= Options(headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-api-key': '761b3272de8b74357a603060ac4100b593f2debd4daf6064aa1605a0b6fbf83532473d5390f0aa6cad1b5211852b8d61e9670744f3f3e1ebc4b8707da86a82f6'
      });
        uri = '${BASE_URL}$uri';
      final response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }


  Future<Response> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      options ??= Options(headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-api-key': '761b3272de8b74357a603060ac4100b593f2debd4daf6064aa1605a0b6fbf83532473d5390f0aa6cad1b5211852b8d61e9670744f3f3e1ebc4b8707da86a82f6'
      });
      uri = '${BASE_URL}$uri';
      final response = await dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

   Future<Response> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      options ??= Options(headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'x-api-key': '761b3272de8b74357a603060ac4100b593f2debd4daf6064aa1605a0b6fbf83532473d5390f0aa6cad1b5211852b8d61e9670744f3f3e1ebc4b8707da86a82f6'
      });
        uri = '${BASE_URL}$uri';
      final response = await dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

Future<Response> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      options ??= Options(headers: {});
        uri = '${BASE_URL}$uri';
      
      final response = await dio!.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      options ??= Options(headers: {
       'Content-Type': 'application/json; charset=UTF-8',
      'x-api-key': '761b3272de8b74357a603060ac4100b593f2debd4daf6064aa1605a0b6fbf83532473d5390f0aa6cad1b5211852b8d61e9670744f3f3e1ebc4b8707da86a82f6'
      });
        uri = '${BASE_URL}$uri';
      final response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException('Unable to process the data');
    } catch (e) {
      rethrow;
    }
  }
}
