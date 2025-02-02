import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  bool showPassword = true;
  void showPass() {
    showPassword = !showPassword;
    emit(ShowPassword());
  }
}
