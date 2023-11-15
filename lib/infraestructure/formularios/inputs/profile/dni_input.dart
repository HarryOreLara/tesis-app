import 'package:formz/formz.dart';

// Define input validation errors
enum DniProfileError { empty, length, nonNumeric }

// Extend FormzInput and provide the input type and error type.
class DniProfile extends FormzInput<String, DniProfileError> {
  // Call super.pure to represent an unmodified form input.
  const DniProfile.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const DniProfile.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == DniProfileError.empty) return 'El campo es requerido';
    if (displayError == DniProfileError.length) return 'Minimo 8 caracteres';
    if (displayError == DniProfileError.nonNumeric) return 'Solo se permiten números';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  DniProfileError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return DniProfileError.empty;
    if (value.length != 8) return DniProfileError.length;
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) return DniProfileError.nonNumeric;

    return null;
  }
}
