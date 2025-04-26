import 'package:techgrains/com/techgrains/service/error/tg_error.dart';
class ServiceError extends TGError {
  int? timestamp;
  int? httpStatus;
  String? httpError;

  String message = "";
  List<String> details = [];

  bool? hasError;
  bool? hasErrors;

  ServiceError({
    this.timestamp,
    this.httpStatus,
    this.httpError,
    this.message = "",
    this.details = const [],
    this.hasError,
    this.hasErrors,
  });

  @override
  ServiceError fromJson(dynamic json) {
    details = json['details'] != null ? json['details'].cast<String>() : [];

    return ServiceError(
        timestamp: json["timestamp"],
        httpStatus: json["httpStatus"],
        httpError: json["httpError"],
        message: json["message"] ?? "",
        details: details,
        hasError: message.isNotEmpty,
        hasErrors: details.isNotEmpty);
  }

  String getMessage() {
    if (!hasError!) return "";
    return message;
  }

  List<String?> getDetails() {
    if (!hasErrors!) return [];
    return details;
  }
}
