import 'package:tesis_app/infraestructure/models/medicines/medicines_list_response.dart';

class MedicinesReponse {
  //MovieDbResponse
  final bool ok;
  final String msg;
  final List<MedicineList> newMedicine;

  MedicinesReponse(
      {required this.ok, required this.msg, required this.newMedicine});

factory MedicinesReponse.fromJson(Map<String, dynamic> json) =>
    MedicinesReponse(
      ok: json["ok"] ?? '',
      msg: json["msg"] ?? '',
      newMedicine: (json["medicineList"] as List<dynamic>?)
          ?.map((x) => MedicineList.fromJson(x))
          .toList() ?? [],
    );


  Map<String, dynamic> toJson() => {
        "ok": ok,
        "msg": msg,
      };
}
