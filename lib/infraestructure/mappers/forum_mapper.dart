import 'package:tesis_app/infraestructure/models/forum/forum_model.dart';

class ForumMapper {
  static ForumModel forumDbToEntity(ForumModel forum) => ForumModel(
      id: forum.id,
      titulo: forum.titulo,
      descripcion: forum.descripcion,
      creator: forum.creator,
      createdAt: forum.createdAt);
}
