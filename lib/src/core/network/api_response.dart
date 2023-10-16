class ApiResponse {
  final bool status;
  final dynamic data;
  final String? token;
  final String? error;
  final String? msg;

  ApiResponse(
      {required this.status, this.data, this.token, this.error, this.msg});

  factory ApiResponse.fromJSON(Map<String, dynamic> json) {
    return ApiResponse(
        status: json['status'],
        data: json['data'],
        token: json['token'],
        error: json['error'],
        msg: json['msg']);
  }
}
