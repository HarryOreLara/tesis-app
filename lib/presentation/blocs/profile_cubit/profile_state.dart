part of 'profile_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class ProfileState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final NombreProfile nombreProfile;
  final ApellidosProfile apellidosProfile;
  final DniProfile dniProfile;
  final EdadProfile edadProfile;
  final GeneroProfile generoProfile;

  const ProfileState(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false,
      this.nombreProfile = const NombreProfile.pure(),
      this.apellidosProfile = const ApellidosProfile.pure(),
      this.dniProfile = const DniProfile.pure(),
      this.edadProfile = const EdadProfile.pure(),
      this.generoProfile = const GeneroProfile.pure()});

  ProfileState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    NombreProfile? nombreProfile,
    ApellidosProfile? apellidosProfile,
    DniProfile? dniProfile,
    EdadProfile? edadProfile,
    GeneroProfile? generoProfile,
  }) =>
      ProfileState(
        formStatus: formStatus ?? this.formStatus,
        isValid: isValid ?? this.isValid,
        nombreProfile: nombreProfile ?? this.nombreProfile,
        apellidosProfile: apellidosProfile ?? this.apellidosProfile,
        dniProfile: dniProfile ?? this.dniProfile,
        edadProfile: edadProfile ?? this.edadProfile,
        generoProfile: generoProfile ?? this.generoProfile,
      );

  @override
  List<Object> get props => [
        formStatus,
        isValid,
        nombreProfile,
        apellidosProfile,
        dniProfile,
        edadProfile,
        generoProfile
      ];
}
