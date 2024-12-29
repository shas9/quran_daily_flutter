class ApiResponse<T> {
  final T? data;
  final String? error;
  final int? statusCode;
  final bool isSuccess;

  ApiResponse.success(this.data, {this.statusCode})
      : error = null,
        isSuccess = true;

  ApiResponse.error(this.error, {this.statusCode})
      : data = null,
        isSuccess = false;
}