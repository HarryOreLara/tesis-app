import 'dart:convert';

import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/forum/forum_entitie.dart';

class ForumModel extends Forum {
  const ForumModel(
      {required super.id,
      required super.titulo,
      required super.descripcion,
      required super.creator,
      required super.createdAt});

  const ForumModel.empty()
      : this(
            id: "1",
            titulo: "_empty_titulo",
            descripcion: "_empty_descripcion",
            creator: "_empty_creator",
            createdAt: "_empty_createdAt");

  factory ForumModel.fromJson(String source) =>
      ForumModel.fromMap(jsonDecode(source) as DataMap);

  ForumModel.fromMap(DataMap map)
      : this(
            id: map["_id"] as String,
            titulo: map["titulo"] as String,
            descripcion: map["descripcion"] as String,
            creator: map["creator"] as String,
            createdAt: map["createdAt"] as String);

  ForumModel copyWith(
      {String? id,
      String? titulo,
      String? descripcion,
      String? creator,
      String? createdAt}) {
    return ForumModel(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        descripcion: descripcion ?? this.descripcion,
        creator: creator ?? this.creator,
        createdAt: createdAt ?? this.createdAt);
  }

  DataMap toMap() => {
        "_id": id,
        "titulo": titulo,
        "descripcion": descripcion,
        "creator": creator,
        "createdAt": createdAt
      };

  String toJson() => jsonEncode(toMap());
}
