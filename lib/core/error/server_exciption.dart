class ServerExciption implements Exception {
  final String message;
  final int statusCode;
  final Map<String, dynamic> data;

  ServerExciption({
    required this.message,
    required this.statusCode,
    required this.data,
  });

} 