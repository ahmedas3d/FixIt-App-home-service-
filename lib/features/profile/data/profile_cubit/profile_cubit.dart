import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fixit_app/Models/user_model.dart';
import 'package:fixit_app/features/profile/data/repository/user_repo_get.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserRepo repo;

  ProfileCubit(this.repo) : super(ProfileInitial());

  Future<void> getUserData() async {
    if (state is ProfileLoading) return;
    emit(ProfileLoading());
    // هنا يمكنك استبدال هذا الجزء بكودك الخاص لجلب بيانات المستخدم
    try {
      final user = await repo.getUsers();
      emit(ProfileLoaded(user)); // استخدام ProfileLoaded بدل ProfileSuccess
    } on DioException {
      emit(ProfileError('حدث خطاء في الاتصال'));
    } catch (e) {
      emit(ProfileError('حدث خطاء غير متوقع'));
    }
  }

  Future<void> updateUserData(
    String userId,
    Map<String, dynamic> updatedData,
  ) async {
    emit(ProfileLoading());
    try {
      final updatedUser = await repo.updateUser(
        userId: userId,
        updatedData: updatedData,
      );
      emit(ProfileUpdated(updatedUser));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
