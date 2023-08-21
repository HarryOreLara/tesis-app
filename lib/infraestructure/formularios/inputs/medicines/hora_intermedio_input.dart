import 'package:formz/formz.dart';

// Define input validation errors
enum HoraIntermediaError { empty, length }

// Extend FormzInput and provide the input type and error type.
class HoraIntermedia extends FormzInput<String, HoraIntermediaError> {
  // Call super.pure to represent an unmodified form input.
  const HoraIntermedia.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const HoraIntermedia.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == HoraIntermediaError.empty) return 'El campo es requerido';
    if (displayError == HoraIntermediaError.length) return 'Minimo 6 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  HoraIntermediaError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return HoraIntermediaError.empty;
    if (value.length > 6) return HoraIntermediaError.length;

    return null;
  }
}
