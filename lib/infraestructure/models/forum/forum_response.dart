import 'package:tesis_app/domain/entities/forum/forum_entitie.dart';

class ForumResponse {
  final bool ok;
  final List<Forum> foro;

  ForumResponse({required this.ok, required this.foro});

  factory ForumResponse.fromJson(Map<String, dynamic> json) => ForumResponse(
      ok: json["ok"] ?? '',
      foro: (json["foro"] as List<dynamic>?)
              ?.map((foro) => Forum.fromJson(foro))
              .toList() ??
          []);

  Map<String, dynamic> toJson() => {"ok": ok, "foro": foro};
}
