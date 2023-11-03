import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/infraestructure/models/forum/respuesta_forum_model.dart';

class RespuestaForumReponse {
  final bool ok;
  final List<RespuestaForoModel> foro;

  RespuestaForumReponse({required this.ok, required this.foro});

  factory RespuestaForumReponse.fromJson(DataMap json) => RespuestaForumReponse(
      ok: json["ok"] ?? '',
      foro: (json["foro"] as List<dynamic>?)
              ?.map((e) => RespuestaForoModel.fromMap(e))
              .toList() ??
          []);

  Map<String, dynamic> toJson() => {"ok": ok, "foro": foro};
}
