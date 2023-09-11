import 'package:formz/formz.dart';

// Define input validation errors
enum MessageTextError { empty, length }

// Extend FormzInput and provide the input type and error type.
class MessageText extends FormzInput<String, MessageTextError> {
  // Call super.pure to represent an unmodified form input.
  const MessageText.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const MessageText.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == MessageTextError.empty) return 'El campo es requerido';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  MessageTextError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return MessageTextError.empty;

    return null;
  }
}
