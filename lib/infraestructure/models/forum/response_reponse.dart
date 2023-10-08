import 'package:tesis_app/core/utils/typedef.dart';

class ResponseReponse {
  final bool ok;
  final String message;

  ResponseReponse({required this.ok, required this.message});

  factory ResponseReponse.fromJson(DataMap json) =>
      ResponseReponse(ok: json["ok"] ?? '', message: json["message"] ?? '');

  Map<String, dynamic> toJson() => {"ok": ok, "message": message};
}
