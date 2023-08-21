part of 'new_medicines_cubit.dart';

//Es como si fuere el result en httpclient
enum FormStatus { invalid, valid, validating, posting }

class NewMedicinesState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final NombreMedicine nombreMedicine;
  final HoraInicio horaInicio;
  final HoraIntermedia horaIntermedia;
  final HoraFin horaFin;
  final CantidadPastillas cantidadPastillas;

  const NewMedicinesState(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.nombreMedicine = const NombreMedicine.pure(),
      this.horaInicio = const HoraInicio.pure(),
      this.horaIntermedia = const HoraIntermedia.pure() , 
      this.horaFin = const HoraFin.pure(),
      this.cantidadPastillas = const CantidadPastillas.pure()});

  NewMedicinesState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    NombreMedicine? nombreMedicine,
    HoraInicio? horaInicio,
    HoraIntermedia? horaIntermedia,
    HoraFin? horaFin,
    CantidadPastillas? cantidadPastillas,
  }) =>
      NewMedicinesState(
          formStatus: formStatus ?? this.formStatus,
          isValid: isValid ?? this.isValid,
          nombreMedicine: nombreMedicine ?? this.nombreMedicine,
          horaInicio: horaInicio ?? this.horaInicio,
          horaIntermedia: horaIntermedia ?? this.horaIntermedia,
          horaFin: horaFin ?? this.horaFin,
          cantidadPastillas: cantidadPastillas ?? this.cantidadPastillas);

  @override
  List<Object> get props => [
        formStatus,
        isValid,
        nombreMedicine,
        horaFin,
        horaIntermedia,
        horaInicio,
        cantidadPastillas
      ];
}
