import 'package:flutter/material.dart';

class LanguageController {
  static final LanguageController instance = LanguageController._internal();

  LanguageController._internal();

  final ValueNotifier<Locale> locale = ValueNotifier(const Locale('en'));

  void changeLanguage(Locale newLocale) {
    locale.value = newLocale;
  }
}