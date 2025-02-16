import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future<AuthResponse> _googleSignIn() async {
    /// TODO: update the Web client ID with your own.
    ///
    /// Web Client ID that you registered with Google Cloud.
    const webClientId = 'my-web.apps.googleusercontent.com';

    /// TODO: update the iOS client ID with your own.
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
}
