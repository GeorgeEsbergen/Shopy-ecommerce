import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  bool showPassword = true;

  SupabaseClient client = Supabase.instance.client;
  void showPass() {
    showPassword = !showPassword;
    emit(ShowPassword());
  }

  Future<void> signup(
      {required String name,
      required String phone,
      required String email,
      required String password}) async {
    emit(SignupLoading());
    try {
      await client.auth.signUp(password: password, email: email);
      //********** Add User Data to table (users)********************* */
      await addUserData(name: name, email: email, phone: phone);
      emit(SignupSuccess());
    } on AuthApiException catch (e) {
      log(e.toString());
      emit(SignupFailure(message: e.message));
    } catch (e) {
      log(e.toString());
      emit(SignupFailure(message: e.toString()));
    }
  }

  Future<void> addUserData(
      {required String name,
      required String email,
      required String phone}) async {
    emit(AddUserDataLoading());
    try {
      await client.from('users').insert({
        "user_id": client.auth.currentUser!.id,
        "name": name,
        "email": email,
        "phone": phone
      });
      emit(AddUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddUserDataFailure());
    }
  }
}
