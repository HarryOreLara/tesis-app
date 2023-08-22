import 'package:formz/formz.dart';

// Define input validation errors
enum NombreProfileError { empty, length }

// Extend FormzInput and provide the input type and error type.
class NombreProfile extends FormzInput<String, NombreProfileError> {
  // Call super.pure to represent an unmodified form input.
  const NombreProfile.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const NombreProfile.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NombreProfileError.empty) return 'El campo es requerido';
    if (displayError == NombreProfileError.length) return 'Minimo 20 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NombreProfileError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return NombreProfileError.empty;
    if (value.length > 20) return NombreProfileError.length;

    return null;
  }
}
