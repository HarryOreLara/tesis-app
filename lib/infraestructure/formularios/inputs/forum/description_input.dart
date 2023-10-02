import 'package:formz/formz.dart';

// Define input validation errors
enum DescriptionForumError { empty, length }

// Extend FormzInput and provide the input type and error type.
class DescriptionForum extends FormzInput<String, DescriptionForumError> {
  // Call super.pure to represent an unmodified form input.
  const DescriptionForum.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const DescriptionForum.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == DescriptionForumError.empty) return 'El campo es requerido';
    if (displayError == DescriptionForumError.length) return 'Minimo 8 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  DescriptionForumError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return DescriptionForumError.empty;
    if (value.length < 5) return DescriptionForumError.length;

    return null;
  }
}
