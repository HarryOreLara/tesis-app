import 'package:tesis_app/domain/datasources/redesneuronales/neuronales_datasource_domain.dart';
import 'package:tesis_app/domain/entities/redesneuronales/neurona.dart';
import 'package:tesis_app/domain/repositories/redesneuronales/neuronales_repository_domain.dart';

class NeuronalesRepositoryInfra extends NeuronalesRepositoryDomain {
  final NeuronalesDatasourceDomain neuronalesDatasourceDomain;

  NeuronalesRepositoryInfra(this.neuronalesDatasourceDomain);

  @override
  Future<void> createAnalisis(Neurona neurona) {
    return neuronalesDatasourceDomain.createAnalisis(neurona);
  }
}
