import 'package:formz/formz.dart';

// Define input validation errors
enum TitleForumError { empty, length }

// Extend FormzInput and provide the input type and error type.
class TitleForum extends FormzInput<String, TitleForumError> {
  // Call super.pure to represent an unmodified form input.
  const TitleForum.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const TitleForum.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == TitleForumError.empty) return 'El campo es requerido';
    if (displayError == TitleForumError.length) return 'Minimo 8 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  TitleForumError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return TitleForumError.empty;
    if (value.length < 5) return TitleForumError.length;

    return null;
  }
}
