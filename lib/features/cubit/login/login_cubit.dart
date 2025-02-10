import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool showPassword = true;

  SupabaseClient client = Supabase.instance.client;
  void showPass() {
    showPassword = !showPassword;
    emit(ShowPassword());
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await client.auth.signInWithPassword(password: password, email: email);
      emit(LoginSuccess());
    } on AuthApiException catch (e) {
      log(e.toString());
      emit(LoginFailure(message: e.message));
    } catch (e) {
      log(e.toString());
      emit(LoginFailure(message: e.toString()));
    }
  }
}
