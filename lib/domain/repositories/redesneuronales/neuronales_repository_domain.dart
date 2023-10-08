import 'package:tesis_app/domain/entities/redesneuronales/neurona.dart';

abstract class NeuronalesRepositoryDomain{
    Future<void> createAnalisis(Neurona neurona);

}