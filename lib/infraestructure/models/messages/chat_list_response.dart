import 'package:tesis_app/domain/entities/messages/chat_entitie.dart';

class ChatListResponse {
  final bool ok;
  final List<Chats> listChats;

  ChatListResponse({required this.ok, required this.listChats});

  factory ChatListResponse.fromJson(Map<String, dynamic> json) =>
      ChatListResponse(
          ok: json["ok"] ?? '',
          listChats: (json["listChats"] as List<dynamic>?)
                  ?.map((e) => Chats.fromJson(e))
                  .toList() ??
              []);

  Map<String, dynamic> toJson() => {"ok": ok, "listChats": listChats};
}
