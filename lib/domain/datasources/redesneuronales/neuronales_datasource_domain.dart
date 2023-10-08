import 'package:tesis_app/domain/entities/redesneuronales/neurona.dart';

abstract class NeuronalesDatasourceDomain {
  Future<void> createAnalisis(Neurona neurona);
}

