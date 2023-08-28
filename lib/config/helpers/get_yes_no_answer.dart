import 'package:dio/dio.dart';
import 'package:tesis_app/domain/entities/assistant/message.dart';
import 'package:tesis_app/infraestructure/models/assistant/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
