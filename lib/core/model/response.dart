class Response<T> {
  final bool success;
  final String? message;
  final T? data;

  Response({
    required this.success,
    this.message,
    this.data,
  });

  factory Response.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic json) fromJsonT,
      ) {
    return Response<T>(
      success: json['success'] ?? false,
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(dynamic Function(T? data) toJsonT) {
    return {
      'success': success,
      'message': message,
      'data': data != null ? toJsonT(data) : null,
    };
  }
}
