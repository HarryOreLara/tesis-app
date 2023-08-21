// To parse this JSON data, do
//
//     final medicinesReponse = medicinesReponseFromJson(jsonString);

import 'dart:convert';

MedicinesReponse medicinesReponseFromJson(String str) => MedicinesReponse.fromJson(json.decode(str));

String medicinesReponseToJson(MedicinesReponse data) => json.encode(data.toJson());

class MedicinesReponse {
    final bool ok;
    final String msg;
    final dynamic data;

    MedicinesReponse({
        required this.ok,
        required this.msg,
        this.data = ""
    });

    factory MedicinesReponse.fromJson(Map<String, dynamic> json) => MedicinesReponse(
        ok: json["ok"],
        msg: json["msg"],
        data: json["newMedicine"]
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "msg": msg,
    };
}
