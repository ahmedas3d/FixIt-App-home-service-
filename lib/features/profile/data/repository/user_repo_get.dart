import 'package:dio/dio.dart';
import 'package:fixit_app/Models/user_model.dart';

class UserRepo {
  final Dio dio;
  static const String _baseUrl =
      'https://home-service-neon.vercel.app/api/users/';

  UserRepo(this.dio);

  Future<List<UserModel>> getUsers({
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final response = await dio.get(
        _baseUrl,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception(
          'Failed to load service providers. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      // تم التغيير هنا من DioError إلى DioException
      throw _handleDioException(e); // تم تحديث اسم الدالة
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<UserModel> updateUser({
    required String userId,
    required Map<String, dynamic> updatedData,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    try {
      final response = await dio.put(
        '$_baseUrl$userId',
        data: updatedData,
        cancelToken: cancelToken,
        options: options,
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to update user. Status code: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw _handleDioException(e);
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Exception _handleDioException(DioException e) {
    // تم تحديث اسم الدالة ونوع المعامل
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Request timeout. Please check your connection');
      case DioExceptionType.badResponse:
        return Exception(
          'Server error: ${e.response?.statusCode} - ${e.response?.statusMessage}',
        );
      case DioExceptionType.cancel:
        return Exception('Request was cancelled');
      case DioExceptionType.connectionError:
        return Exception(
          'Connection error. Please check your internet connection',
        );
      case DioExceptionType.unknown:
      default:
        return Exception('Network error: ${e.message}');
    }
  }
}
