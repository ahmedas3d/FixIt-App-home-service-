part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final List<UserModel> users;
  ProfileLoaded(this.users);
}

final class ProfileError extends ProfileState {
  final String errorMessage;
  ProfileError(this.errorMessage);
}

class ProfileUpdated extends ProfileState {
  final UserModel user;
  ProfileUpdated(this.user);
}
