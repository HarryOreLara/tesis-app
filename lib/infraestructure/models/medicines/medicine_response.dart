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
        //newMedicine: (json["newMedicine"] == null ? ''  : json["newMedicine"])
        //newMedicine: json["newMedicine"] ?? null
        //newMedicine: json["medicineList"]
        // newMedicine: List<MedicineList>.from(json["medicineList"].map((x)=>x))
        newMedicine: List<MedicineList>.from(
            json["medicineList"].map((x) => MedicineList.fromJson(x))),
        //List<int>.from(json["genre_ids"].map((x) => x)),
        // newMedicine: (json["medicineList"] != null)
        //     ? List<MedicineList>.from(
        //         json["newMedicine"].map((x) => MedicineList.fromJson(x)))
        //     : [],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "msg": msg,
      };
}
