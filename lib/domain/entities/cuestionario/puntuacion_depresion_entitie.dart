class PuntuacionDepresion {
  final int si;
  final int no;

  PuntuacionDepresion({required this.si, required this.no});

  factory PuntuacionDepresion.fromJson(Map<String, dynamic> json) =>
      PuntuacionDepresion(si: json["si"] ?? '', no: json["no"] ?? '');

  Map<String, dynamic> toJson() => {"si": si, "no": no};
}
