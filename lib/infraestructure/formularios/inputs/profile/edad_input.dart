import 'package:formz/formz.dart';

// Define input validation errors
enum EdadProfileError { empty, length }

// Extend FormzInput and provide the input type and error type.
class EdadProfile extends FormzInput<String, EdadProfileError> {
  // Call super.pure to represent an unmodified form input.
  const EdadProfile.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const EdadProfile.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == EdadProfileError.empty) return 'El campo es requerido';
    if (displayError == EdadProfileError.length) return 'Minimo 20 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  EdadProfileError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EdadProfileError.empty;
    if (value.length > 3) return EdadProfileError.length;

    return null;
  }
}
