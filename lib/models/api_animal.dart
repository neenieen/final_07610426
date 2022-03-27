class ApiAnimal {
  final String status;
  final String? message;
  final dynamic data;

  ApiAnimal({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiAnimal.fromJson(Map<String, dynamic> json) {
    return ApiAnimal(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}