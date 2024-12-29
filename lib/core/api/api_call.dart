import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:quran_daily/core/api/api_response.dart';

Future<ApiResponse<T>> apiCall<T>(Future<Response> Function() block) async {
  try {
    // Execute the Dio request
    final response = await block();

    if (response.statusCode != null &&
        response.statusCode! >= 200 &&
        response.statusCode! < 300) {
      final data = response.data;
      return ApiResponse.success(
        data,
        statusCode: response.statusCode!,
      );
    } else {
      // Extract the error message and include statusCode
      final errorMessage =
          response.data?['message'] ?? "Unknown error occurred";
      return ApiResponse.error(
        errorMessage,
        statusCode: response.statusCode,
      );
    }
  } catch (error) {
    // Handle Dio-specific exceptions and other errors
    String message;
    int? statusCode;

    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          message = "Request timed out";
          break;
        case DioExceptionType.badResponse:
          final response = error.response;
          if (response != null) {
            statusCode = response.statusCode;
            Map<String, dynamic>? responseData;
            if (response.data != null && response.data.toString().isNotEmpty) {
               responseData = response.data is String ? jsonDecode(response.data) : response.data;
            }
            message = responseData?['message'] ?? "Unknown error occurred";
          } else {
            message = "Received an invalid response";
          }
          break;
        case DioExceptionType.cancel:
          message = "Request was cancelled";
          break;
        case DioExceptionType.connectionError:
          message = "Check your internet connection";
          break;
        default:
          message = "An unknown error occurred";
          break;
      }
    } else if (error is SocketException) {
      message = "Check your internet connection";
    } else {
      message = "An unexpected error occurred";
    }

    return ApiResponse.error(
      message,
      statusCode: statusCode,
    );
  }
}
