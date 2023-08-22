class ProfileResponse {
    final bool ok;
    final String id;
    final String nombre;
    final String msg;
    final String token;

    ProfileResponse({
        required this.ok,
        required this.id,
        required this.nombre,
        required this.msg,
        required this.token,
    });

    factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
        ok: json["ok"] ?? '',
        id: json["id"] ?? '',
        nombre: json["nombre"] ?? '',
        msg: json["msg"] ?? '',
        token: json["token"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "id": id,
        "nombre": nombre,
        "msg": msg,
        "token": token,
    };
}
