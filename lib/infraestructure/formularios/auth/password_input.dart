import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordLoginError { empty, length }

// Extend FormzInput and provide the input type and error type.
class PasswordLogin extends FormzInput<String, PasswordLoginError> {
  // Call super.pure to represent an unmodified form input.
  const PasswordLogin.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const PasswordLogin.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordLoginError.empty) return 'El campo es requerido';
    if (displayError == PasswordLoginError.length) return 'Minimo 8 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordLoginError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordLoginError.empty;
    if (value.length < 5) return PasswordLoginError.length;

    return null;
  }
}
