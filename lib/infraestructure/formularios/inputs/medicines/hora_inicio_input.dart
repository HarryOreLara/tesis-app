import 'package:formz/formz.dart';

// Define input validation errors
enum HoraInicioError { empty, length }

// Extend FormzInput and provide the input type and error type.
class HoraInicio extends FormzInput<String, HoraInicioError> {
  // Call super.pure to represent an unmodified form input.
  const HoraInicio.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const HoraInicio.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == HoraInicioError.empty) return 'El campo es requerido';
    if (displayError == HoraInicioError.length) return 'Minimo 6 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  HoraInicioError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return HoraInicioError.empty;
    if (value.length > 6) return HoraInicioError.length;

    return null;
  }
}
