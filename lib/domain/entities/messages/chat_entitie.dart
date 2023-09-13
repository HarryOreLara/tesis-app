class Chat {
  final String message;
  final String room;


  Chat({required this.message, required this.room});

  factory Chat.fromJson(Map<String, dynamic> json) =>
      Chat(message: json["message"] ?? '', room: json["room"] ?? '');

  Map<String, dynamic> toJson() {
    return {"message": message, "room": room};
  }
}
