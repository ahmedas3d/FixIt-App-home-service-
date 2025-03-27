import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    checkLoginState(); // يتحقق من حالة المستخدم عند بدء التطبيق
  }

  Future<void> checkLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      emit(AuthLoggedIn()); // لو مسجل دخول، يرسل الحالة `AuthLoggedIn`
    } else {
      emit(AuthLoggedOut()); // لو مش مسجل دخول، يرسل `AuthLoggedOut`
    }
  }

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    emit(AuthLoggedIn()); // تغيير الحالة لـ `AuthLoggedIn`
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    emit(AuthLoggedOut()); // تغيير الحالة لـ `AuthLoggedOut`
  }
}
