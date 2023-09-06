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
      this.horaIntermedia = const HoraIntermedia.pure(),
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

class YourLoadedState extends NewMedicinesState {
  final List<Medicine> medicines;

  const YourLoadedState({
    required this.medicines,
    FormStatus formStatus = FormStatus.valid,
    bool isValid = true,
    NombreMedicine nombreMedicine = const NombreMedicine.pure(),
    HoraInicio horaInicio = const HoraInicio.pure(),
    HoraIntermedia horaIntermedia = const HoraIntermedia.pure(),
    HoraFin horaFin = const HoraFin.pure(),
    CantidadPastillas cantidadPastillas = const CantidadPastillas.pure(),
  }) : super(
          formStatus: formStatus,
          isValid: isValid,
          nombreMedicine: nombreMedicine,
          horaInicio: horaInicio,
          horaIntermedia: horaIntermedia,
          horaFin: horaFin,
          cantidadPastillas: cantidadPastillas,
        );

  @override
  List<Object> get props => [...super.props, medicines];
}

class YourLoadingState extends NewMedicinesState {
  const YourLoadingState({
    FormStatus formStatus = FormStatus.validating,
    bool isValid = true,
    NombreMedicine nombreMedicine = const NombreMedicine.pure(),
    HoraInicio horaInicio = const HoraInicio.pure(),
    HoraIntermedia horaIntermedia = const HoraIntermedia.pure(),
    HoraFin horaFin = const HoraFin.pure(),
    CantidadPastillas cantidadPastillas = const CantidadPastillas.pure(),
  }) : super(
          formStatus: formStatus,
          isValid: isValid,
          nombreMedicine: nombreMedicine,
          horaInicio: horaInicio,
          horaIntermedia: horaIntermedia,
          horaFin: horaFin,
          cantidadPastillas: cantidadPastillas,
        );
}
