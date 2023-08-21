import 'package:formz/formz.dart';

// Define input validation errors
enum NombreMedicineError { empty, length }

// Extend FormzInput and provide the input type and error type.
class NombreMedicine extends FormzInput<String, NombreMedicineError> {
  // Call super.pure to represent an unmodified form input.
  const NombreMedicine.pure() : super.pure(''); //valor inicial

  // Call super.dirty to represent a modified form input.
  const NombreMedicine.dirty(String value)
      : super.dirty(value); //la foma como quiero que cambie el valor

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NombreMedicineError.empty) return 'El campo es requerido';
    if (displayError == NombreMedicineError.length) return 'Minimo 20 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NombreMedicineError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return NombreMedicineError.empty;
    if (value.length > 20) return NombreMedicineError.length;

    return null;
  }
}
