import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fixit_app/Models/service_provider_model.dart';
import 'package:fixit_app/features/home/data/repositories/service_provider_repository.dart';
import 'package:meta/meta.dart';

part 'service_provider_state.dart';

class ServiceProviderCubit extends Cubit<ServiceProviderState> {
  final ServiceProviderRepository repo;
  ServiceProviderCubit(this.repo) : super(ServiceProviderInitial());

  Future<void> getHomeData() async {
    if (state is ServiceProviderLoading) return;

    emit(ServiceProviderLoading());

    try {
      final providers = await repo.getServiceProviders();
      emit(ServiceProviderLoaded(providers));
    } on DioException {
      emit(ServiceProviderError('حدث خطأ في الاتصال'));
    } catch (e) {
      emit(ServiceProviderError('حدث خطأ غير متوقع'));
    }
  }
}
