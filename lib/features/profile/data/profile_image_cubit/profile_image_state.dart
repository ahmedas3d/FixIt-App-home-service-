part of 'profile_image_cubit.dart';

abstract class ProfileImageState {}

class ProfileImageInitial extends ProfileImageState {}

class ProfileImageSelected extends ProfileImageState {
  final File image;

  ProfileImageSelected(this.image);
}

class ProfileImageError extends ProfileImageState {
  final String message;

  ProfileImageError(this.message);
}
