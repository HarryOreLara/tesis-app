import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/infraestructure/models/forum/forum_model.dart';

class ForumResponse {
  final bool ok;
  final List<ForumModel> foro;

  ForumResponse({required this.ok, required this.foro});

  factory ForumResponse.fromJson(DataMap json) {
    final forumList = json["foro"];
    if (forumList == null) {
      return ForumResponse(ok: json["ok"] ?? false, foro: []);
    }

    if (forumList is List<dynamic>) {
      return ForumResponse(
        ok: json["ok"] ?? false,
        foro: forumList.map((e) => ForumModel.fromMap(e)).toList(),
      );
    } else {
      // Manejar el caso en el que json["foro"] no es una lista, por ejemplo, puedes retornar una lista vacía.
      return ForumResponse(ok: json["ok"] ?? false, foro: []);
    }
  }

  Map<String, dynamic> toJson() => {"ok": ok, "foro": foro};
}
