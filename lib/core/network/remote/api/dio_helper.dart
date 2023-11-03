import 'package:dio/dio.dart';
import 'package:real_estate_task/core/app_helper/AppToast.dart';


class DioHelper {
  static Dio? dio;

  /// GET BASE DOMAIN LINK FROM REAL TIME DATABASE THEN START DIO INITIALIZATION
  static void init() async {

    /// DIO INITIALIZATION
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        followRedirects: false,
        receiveDataWhenStatusError: true,
        validateStatus: (status) => status! < 500,
      ),
    );
    dio!.interceptors.addAll({AppInterceptors(dio!)});
  }

  static Future<String> postDate({
    required String data,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    final Response response = await dio!.post(
      '',
      data: {
        'json': data,
      },
    );

    return response.data.toString();
  }
}

/// An interceptor that handles the error responses from a [Dio] request.
class AppInterceptors extends Interceptor {
  AppInterceptors(
    this.dio,
  );

  /// The [Dio] instance used to handle all requests.
  final Dio dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  ///On Response
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  /// ? How to Show error message to user in case of error ?
  /// in the try/catch clause, show alert with error message
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    //override the default error handling
    switch (err) {
      case  DioException.connectionTimeout:
      case  DioException.sendTimeout:
      case  DioException.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case  DioException.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioException.connectionError:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    showFailedToast('Invalid Request');
    return 'Invalid Request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    showFailedToast('Unknown Error Occured, please try again later');
    return 'Unknown Error Occured, please try again later';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    showFailedToast('Conflict Occured');
    return 'Conflict Occured';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    showFailedToast('Access Denied');
    return 'Access Denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    showFailedToast('he requested information could not be found');
    return 'he requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    showFailedToast('No internet connection detected, please try again.');
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    showFailedToast('The connection has timed out, please try again');
    return 'The connection has timed out, please try again';
  }
}
