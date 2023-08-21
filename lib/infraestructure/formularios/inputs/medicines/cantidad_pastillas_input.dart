import 'package:formz/formz.dart';

// Define input validation errors
enum CantidadPastillasError { empty, length }

// Extend FormzInput and provide the input type and error type.
class CantidadPastillas extends FormzInput<String, CantidadPastillasError> {
  // Call super.pure to represent an unmodified form input.
  const CantidadPastillas.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const CantidadPastillas.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == CantidadPastillasError.empty) return 'El campo es requerido';
    if (displayError == CantidadPastillasError.length) return 'Minimo 3 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  CantidadPastillasError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return CantidadPastillasError.empty;
    if (value.length > 3) return CantidadPastillasError.length;

    return null;
  }
}
