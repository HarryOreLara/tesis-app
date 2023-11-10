part of 'login_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class LoginState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final DniProfile dniProfile;
  final PasswordLogin passwordLogin;

  const LoginState(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.dniProfile = const DniProfile.pure(),
      this.passwordLogin = const PasswordLogin.pure()});

  LoginState copyWith(
          {FormStatus? formStatus,
          bool? isValid,
          DniProfile? dniProfile,
          PasswordLogin? passwordLogin}) =>
      LoginState(
          formStatus: formStatus ?? this.formStatus,
          isValid: isValid ?? this.isValid,
          dniProfile: dniProfile ?? this.dniProfile,
          passwordLogin: passwordLogin ?? this.passwordLogin);

  @override
  List<Object> get props => [formStatus, isValid, dniProfile, passwordLogin];
}

