import 'package:fixit_app/core/services/auth_cubit/auth_state.dart' as local;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<local.AuthState> {
  // استخدم local.AuthState بدلاً من AuthState مباشرة
  AuthCubit(bool isLoggedIn) : super(local.AuthInitial()) {
    checkLoginState(isLoggedIn);
  }

  Future<void> checkLoginState(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    final user = Supabase.instance.client.auth.currentUser;

    if (isLoggedIn || user != null) {
      emit(local.AuthLoggedIn());
    } else {
      emit(local.AuthLoggedOut());
    }
  }

  Future<void> login() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    emit(local.AuthLoggedIn());
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await Supabase.instance.client.auth.signOut();
    emit(local.AuthLoggedOut());
  }
}
