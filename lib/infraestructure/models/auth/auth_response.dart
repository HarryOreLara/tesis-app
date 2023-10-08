
import 'package:tesis_app/core/utils/typedef.dart';

class AuthResponse {
  final bool ok;
  final String id;
  final String username;
  final String msg;
  final String token;

  AuthResponse(
      {required this.ok,
      required this.id,
      required this.username,
      required this.msg,
      required this.token});

      
    factory AuthResponse.fromJson(DataMap json) => AuthResponse(
        ok: json["ok"],
        id: json["id"],
        username: json["username"],
        msg: json["msg"],
        token: json["token"],
    );
        Map<String, dynamic> toJson() => {
        "ok": ok,
        "id": id,
        "username": username,
        "msg": msg,
        "token": token,
    };
}

