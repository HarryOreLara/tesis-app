import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/infraestructure/models/medicines/medicine_model.dart';

class MedicinesReponse {
  //MovieDbResponse
  final bool ok;
  final String msg;
  final List<MedicineModel> newMedicine;

  MedicinesReponse(
      {required this.ok, required this.msg, required this.newMedicine});

  factory MedicinesReponse.fromJson(DataMap json) =>
      MedicinesReponse(
        ok: json["ok"] ?? '',
        msg: json["msg"] ?? '',
        newMedicine: (json["medicineList"] as List<dynamic>?)
                ?.map((x) => MedicineModel.fromMap(x))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "msg": msg,
      };
}
