part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final bool loading;
  final String error;
  final bool add;
  final List<ProfileModel> listProfile;
  const ProfileState(
      {this.loading = false,
      this.error = '',
      this.add = false,
      this.listProfile = const []});

  ProfileState copyWith(
          {bool? loading,
          String? error,
          bool? add,
          List<ProfileModel>? listProfile}) =>
      ProfileState(
          loading: loading ?? this.loading,
          error: error ?? this.error,
          add: add ?? this.add,
          listProfile: listProfile ?? this.listProfile);

  @override
  List<Object> get props => [loading, error, add, listProfile];
}

final class ProfileInitial extends ProfileState {}
