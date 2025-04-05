part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ServiceProvider> providers;
  HomeLoaded(this.providers);
}

class HomeError extends HomeState {
  final String errorMessage;
  HomeError(this.errorMessage);
}
