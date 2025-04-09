part of 'service_provider_cubit.dart';

@immutable
sealed class ServiceProviderState {}

final class ServiceProviderInitial extends ServiceProviderState {}

class ServiceProviderLoading extends ServiceProviderState {}

class ServiceProviderLoaded extends ServiceProviderState {
  final List<ServiceProvider> providers;
  ServiceProviderLoaded(this.providers);
}

class ServiceProviderError extends ServiceProviderState {
  final String errorMessage;
  ServiceProviderError(this.errorMessage);
}
