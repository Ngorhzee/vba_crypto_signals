import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../models/failure.dart';
import '../constants/api_routes.dart';

import 'network_interceptors.dart';

enum FormDataType { post, patch }

class NetworkClient {
  NetworkClient._internal();
  static final _singleton = NetworkClient._internal();

  factory NetworkClient() => _singleton;

  //late final LocalCache _localCache = locator();

  final Dio _dio = createDio();

// ======================================================
//================== Dio Initialization =================
//=======================================================

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: ApiRoutes.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(milliseconds: 40000), // 15 seconds
      connectTimeout: const Duration(milliseconds: 40000),
      sendTimeout: const Duration(milliseconds: 40000),
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }

  Map<String, String> get _getAuthHeader {
    return {};
  }

// ======================================================
//======================== POST ==========================
//=======================================================
  ///Post request
  Future<dynamic> post(
    /// the api route without the base url
    String uri, {
    ///this are query parameters that would
    /// be attached to the url
    /// [e.g]=>{"a":"yes"}
    /// https://she.com/getPeople?a=yes
    Map<String, dynamic> queryParameters = const {},
    Object? body,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await _dio.post(
        uri,
        queryParameters: queryParameters,
        data: body,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: Options(
          headers: {
            // ..._getAuthHeader,
          },
        ),
      );

      log(response.statusCode.toString());
      return response.data;
    } on SocketException {
      rethrow;
    } on Failure {
      rethrow;
    }
  }
}
