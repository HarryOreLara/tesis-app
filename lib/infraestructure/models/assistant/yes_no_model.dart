import 'package:tesis_app/core/utils/typedef.dart';
import 'package:tesis_app/domain/entities/assistant/message.dart';

class YesNoModel {
  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  final String answer;
  final bool forced;
  final String image;

  factory YesNoModel.fromJsonMap(DataMap json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() => Message(
    text: answer == 'yes' ? 'Si' : 'No', 
    fromWho: FromWho.hers,
    imageUrl: image
  );
}
