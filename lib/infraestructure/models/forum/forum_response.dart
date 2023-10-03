import 'package:tesis_app/domain/entities/forum/forum_entitie.dart';

class ForumResponse {
  final bool ok;
  final List<Forum> foro;

  ForumResponse({required this.ok, required this.foro});

  factory ForumResponse.fromJson(Map<String, dynamic> json) {
    final forumList = json["foro"];
    if (forumList == null) {
      return ForumResponse(ok: json["ok"] ?? false, foro: []);
    }

    if (forumList is List<dynamic>) {
      return ForumResponse(
        ok: json["ok"] ?? false,
        foro: forumList.map((e) => Forum.fromJson(e)).toList(),
      );
    } else {
      // Manejar el caso en el que json["foro"] no es una lista, por ejemplo, puedes retornar una lista vacía.
      return ForumResponse(ok: json["ok"] ?? false, foro: []);
    }
  }

  Map<String, dynamic> toJson() => {"ok": ok, "foro": foro};
}
