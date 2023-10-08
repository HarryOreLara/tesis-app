import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/profile/profile_entitie.dart';

class PersonitaReponse {
  final bool ok;
  final List<Profile> persona;

  PersonitaReponse({required this.ok, required this.persona});

  factory PersonitaReponse.fromJson(DataMap json) =>
      PersonitaReponse(
          ok: json["ok"] ?? '',
          persona: (json["persona"] as List<dynamic>)
              .map((e) => Profile.fromJson(e))
              .toList());
}
