import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/forum/respuesta_forum.dart';


class RespuestaForumReponse {
  final bool ok;
  final List<RespuestaForo> foro;

  RespuestaForumReponse({required this.ok, required this.foro});

  factory RespuestaForumReponse.fromJson(DataMap json) {
    final forumList = json["foro"];

    if (forumList == null) {
      return RespuestaForumReponse(ok: json["ok"] ?? false, foro: []);
    }

    if (forumList is List<dynamic>) {
      return RespuestaForumReponse(
          ok: json["ok"] ?? false,
          foro: forumList.map((e) => RespuestaForo.fromJson(e)).toList());
    } else {
      return RespuestaForumReponse(ok: json["ok"] ?? false, foro: []);
    }
  }

  Map<String, dynamic> toJson() =>{"ok":ok, "foro":foro};

}


