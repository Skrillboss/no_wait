import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

class DioConfig {
  static Dio createDioRetry() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: 'https://debo.colocar.mi.api.aqui.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    dio.interceptors.add(RetryInterceptor(
      dio: dio,
      logPrint: print, // specify log function (optional)
      retries: 3, // retry count (optional)
      retryDelays: const [ // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 2), // wait 2 sec before second retry
        Duration(seconds: 3), // wait 3 sec before third retry
      ],
      retryableExtraStatuses: { 400 },

    ));


    return dio;
  }

  static Dio createDio() {
    final dio = Dio();

    dio.options = BaseOptions(
      baseUrl: 'https://debo.colocar.mi.api.aqui.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );



    return dio;
  }
}
