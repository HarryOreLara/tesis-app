import 'package:formz/formz.dart';

// Define input validation errors
enum GeneroProfileError { empty, length }

// Extend FormzInput and provide the input type and error type.
class GeneroProfile extends FormzInput<String, GeneroProfileError> {
  // Call super.pure to represent an unmodified form input.
  const GeneroProfile.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const GeneroProfile.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == GeneroProfileError.empty) return 'El campo es requerido';
    if (displayError == GeneroProfileError.length) return 'Minimo 20 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  GeneroProfileError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return GeneroProfileError.empty;
    if (value.length > 10) return GeneroProfileError.length;

    return null;
  }
}
