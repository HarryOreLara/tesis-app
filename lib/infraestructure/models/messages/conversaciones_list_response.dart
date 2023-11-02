import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/infraestructure/models/conversaciones/conversaciones_model.dart';

class ConversacionestListResponse {
  final bool ok;
  final List<ConversacionesModel> listChats;

  ConversacionestListResponse({required this.ok, required this.listChats});

  factory ConversacionestListResponse.fromJson(DataMap json) =>
      ConversacionestListResponse(
          ok: json["ok"] ?? '',
          listChats: (json["listChats"] as List<dynamic>?)
                  ?.map((e) => ConversacionesModel.fromMap(e))
                  .toList() ??
              []);

  Map<String, dynamic> toJson() => {"ok": ok, "listChats": listChats};
}
