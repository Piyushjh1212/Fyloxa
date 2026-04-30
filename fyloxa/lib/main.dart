import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './controller/language_controller.dart';
import 'widgets/login_card.dart';

void main() {
  runApp(const FyloxaApp());
}

class FyloxaApp extends StatelessWidget {
  const FyloxaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: LanguageController.instance.locale,
      builder: (context, locale, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          locale: locale,

          supportedLocales: const [
            Locale('en'),
            Locale('hi'),
            Locale('gu'),
            Locale('mr'),
            Locale('ta'),
          ],

          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          home: const LoginCard(),
        );
      },
    );
  }
}