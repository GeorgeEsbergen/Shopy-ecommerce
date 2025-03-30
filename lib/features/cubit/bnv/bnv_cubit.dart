import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bnv_state.dart';

class BnvCubit extends Cubit<BnvState> {
  BnvCubit() : super(BnvInitial());
  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    emit(ChangeIndexPage());
  }

  
}
