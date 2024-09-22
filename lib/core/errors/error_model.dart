import 'package:estore/core/api/end_points.dart';

class ErrorModel {
  Object message;
  final String? error;
  final num statusCode;

  ErrorModel({
    required this.message,
    required this.statusCode,
    this.error,
  });
  factory ErrorModel.fromJson(jsonData)
  {
    return ErrorModel(message: jsonData[ApiJsonKey.message], statusCode: jsonData[ApiJsonKey.statusCode], error: jsonData[ApiJsonKey.error]);
  }
}
