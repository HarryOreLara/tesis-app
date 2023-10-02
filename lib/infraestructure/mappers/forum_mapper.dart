import 'package:tesis_app/domain/entities/forum/forum_entitie.dart';

class ForumMapper {
  static Forum forumDbToEntity(Forum forum) => Forum(
      id: forum.id,
      titulo: forum.titulo,
      descripcion: forum.descripcion,
      creator: forum.creator,
      createdAt: forum.createdAt);
}
