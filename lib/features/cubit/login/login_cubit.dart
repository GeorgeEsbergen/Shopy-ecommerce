// ignore_for_file: unused_element

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/functions/api_services.dart';
import '../../view_model/auth/user_data.dart';

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
      await getUserData();
      emit(LoginSuccess());
    } on AuthApiException catch (e) {
      log(e.toString());
      emit(LoginFailure(message: e.message));
    } catch (e) {
      log(e.toString());
      emit(LoginFailure(message: e.toString()));
    }
  }

  Future<AuthResponse> _googleSignIn() async {
    ///
    /// Web Client ID that you registered with Google Cloud.
    const webClientId = 'my-web.apps.googleusercontent.com';

    ///
    /// iOS Client ID that you registered with Google Cloud.
    const iosClientId = 'my-ios.apps.googleusercontent.com';

    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  Future<void> logout() async {
    emit(LogOutLoading());
    try {
      await client.auth.signOut();
      emit(LogOutSuccess());
    } catch (e) {
      log(e.toString());
      emit(LogOutFailure(message: e.toString()));
    }
  }

  Future<void> resetPassword({required String email}) async {
    emit(resetPasswordLoading());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(resetPasswordSuccess());
    } catch (e) {
      log(e.toString());
      emit(resetPasswordFailure());
    }
  }

  GetUserDataModel? getUserDataModel;
  Future<void> getUserData() async {
    emit(getUserDataLoading());
    try {
      final data = await client
          .from('users')
          .select()
          .eq('user_id', client.auth.currentUser!.id);

      getUserDataModel = GetUserDataModel(
        id: data[0]['user_id'],
        email: data[0]['email'],
        name: data[0]['name'],
        phone: data[0]['phone'],
      );
      emit(getUserDataSuccess());
      log(data.toString());
    } catch (e) {
      log(e.toString());
      emit(getUserDataFailure());
    }
  }

  Future<void> updateUserName(String userId, Map<String, dynamic> data) async {
    emit(EditUserDataLoading());
    try {
      final supabase = Supabase.instance.client;

      final response = await supabase
          .from('users') // Replace 'Users' with your table name
          .update(data) // Update the name field
          .eq('user_id', userId); // Filter by user ID

      if (response.error == null) {
        print('Name updated successfully');
        emit(EditUserDataSuccess());
      } else {
        print('Error updating name: ${response.error.message}');
        emit(EditUserDataFailure());
      }
    } catch (e) {
      print('Error name: ${e.toString()}');
      emit(EditUserDataFailure());
    }
  }
}
