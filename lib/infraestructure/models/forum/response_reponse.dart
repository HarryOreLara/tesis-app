class ResponseReponse {
  final bool ok;
  final String message;

  ResponseReponse({required this.ok, required this.message});

  factory ResponseReponse.fromJson(Map<String, dynamic> json) =>
      ResponseReponse(ok: json["ok"] ?? '', message: json["message"] ?? '');

  Map<String, dynamic> toJson() => {"ok": ok, "message": message};
}
