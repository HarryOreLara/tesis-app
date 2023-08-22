import 'package:formz/formz.dart';

// Define input validation errors
enum DniProfileError { empty, length }

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
    if (displayError == DniProfileError.length) return 'Minimo 20 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  DniProfileError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return DniProfileError.empty;
    if (value.length > 9) return DniProfileError.length;

    return null;
  }
}
