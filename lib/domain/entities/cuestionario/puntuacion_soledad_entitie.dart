class PuntuacionSoledad {
  final int nunca;
  final int aveces;
  final int conFrecuencia;
  final int siempre;

  PuntuacionSoledad(
      {required this.nunca,
      required this.aveces,
      required this.conFrecuencia,
      required this.siempre});

  factory PuntuacionSoledad.fromJson(Map<String, dynamic> json) =>
      PuntuacionSoledad(
          nunca: json["nunca"] ?? '',
          aveces: json["aveces"] ?? '',
          conFrecuencia: json["conFrecuencia"] ?? '',
          siempre: json["siempre"] ?? '');
}
