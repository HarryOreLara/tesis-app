import 'package:formz/formz.dart';

// Define input validation errors
enum HoraFinError { empty, length }

// Extend FormzInput and provide the input type and error type.
class HoraFin extends FormzInput<String, HoraFinError> {
  // Call super.pure to represent an unmodified form input.
  const HoraFin.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const HoraFin.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == HoraFinError.empty) return 'El campo es requerido';
    if (displayError == HoraFinError.length) return 'Minimo 6 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  HoraFinError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return HoraFinError.empty;
    if (value.length > 6) return HoraFinError.length;

    return null;
  }
}
