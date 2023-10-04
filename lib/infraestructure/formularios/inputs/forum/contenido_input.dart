import 'package:formz/formz.dart';

// Define input validation errors
enum ContenidoRespuestaForumError { empty, length }

// Extend FormzInput and provide the input type and error type.
class ContenidoRespuestaForum extends FormzInput<String, ContenidoRespuestaForumError> {
  // Call super.pure to represent an unmodified form input.
  const ContenidoRespuestaForum.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const ContenidoRespuestaForum.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == ContenidoRespuestaForumError.empty) return 'El campo es requerido';
    if (displayError == ContenidoRespuestaForumError.length) return 'Minimo 8 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  ContenidoRespuestaForumError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return ContenidoRespuestaForumError.empty;
    if (value.length < 3) return ContenidoRespuestaForumError.length;

    return null;
  }
}
