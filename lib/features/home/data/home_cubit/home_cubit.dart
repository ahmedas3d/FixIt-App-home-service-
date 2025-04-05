import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fixit_app/Models/service_provider_model.dart';
import 'package:fixit_app/features/home/data/repositories/service_provider_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ServiceProviderRepository repo;

  HomeCubit(this.repo) : super(HomeInitial());

  Future<void> getHomeData() async {
    if (state is HomeLoading) return;

    emit(HomeLoading());

    try {
      final providers = await repo.getServiceProviders();
      emit(HomeLoaded(providers)); // استخدام HomeLoaded بدل HomeSuccess
    } on DioException {
      emit(HomeError('حدث خطأ في الاتصال'));
    } catch (e) {
      emit(HomeError('حدث خطأ غير متوقع'));
    }
  }
}
