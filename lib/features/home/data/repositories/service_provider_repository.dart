import 'package:dio/dio.dart';
import 'package:fixit_app/Models/service_provider_model.dart';

class ServiceProviderRepository {
  final Dio dio;
  static const String _baseUrl =
      'https://home-service-neon.vercel.app/api/service-providers/';

  ServiceProviderRepository(this.dio);

  Future<List<ServiceProvider>> getServiceProviders({
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
        return data.map((e) => ServiceProvider.fromJson(e)).toList();
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
