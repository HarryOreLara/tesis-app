import 'package:formz/formz.dart';

// Define input validation errors
enum ApellidosProfileError { empty, length }

// Extend FormzInput and provide the input type and error type.
class ApellidosProfile extends FormzInput<String, ApellidosProfileError> {
  // Call super.pure to represent an unmodified form input.
  const ApellidosProfile.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const ApellidosProfile.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == ApellidosProfileError.empty) return 'El campo es requerido';
    if (displayError == ApellidosProfileError.length) return 'Minimo 20 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  ApellidosProfileError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return ApellidosProfileError.empty;
    if (value.length > 20) return ApellidosProfileError.length;

    return null;
  }
}
