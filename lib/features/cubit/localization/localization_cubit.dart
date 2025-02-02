
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/localization/save_lang.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());
  Future<void> getSavedLanguage() async {
    final String getLanguageCode =
        await LanguageGetHelper().getCacheLanguageCode();
    emit(changeLanuageState(locale: Locale(getLanguageCode)));
  }

Future<void> changeLanguage(String languageCode) async {
    
        await LanguageGetHelper().cacheLanguageCode(languageCode);
    emit(changeLanuageState(locale: Locale(languageCode)));
  }



}
