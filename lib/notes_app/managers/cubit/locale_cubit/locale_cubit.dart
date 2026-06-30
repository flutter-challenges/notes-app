import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LocaleCubit extends HydratedCubit<Locale> {
  LocaleCubit() : super(const Locale('ar'));

  void changeLanguage(String languageCode) {
    emit(Locale(languageCode));
  }

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    return Locale(json['language_code'] as String);
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {'language_code': state.languageCode};
  }
}