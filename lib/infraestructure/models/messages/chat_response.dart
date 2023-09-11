class ChatResponse {
  final bool ok;
  final String message;

  ChatResponse({required this.ok, required this.message});

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      ChatResponse(ok: json["ok"] ?? false, message: json["message"] ?? '');

  Map<String, dynamic> toJson() => {
    "ok":ok,
    "message":message
  };
}
