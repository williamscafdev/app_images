import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:app_images/app.dart';
import 'package:app_images/core/services/data_preferences.dart';
import 'package:app_images/src/src.dart';

void mainCommon() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      DartPluginRegistrant.ensureInitialized();
      await EasyLocalization.ensureInitialized();

      configureDependencies();
      await sl<DataPreferences>().initialize();
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      Future.delayed(const Duration(seconds: 5), FlutterNativeSplash.remove);

      runApp(
        EasyLocalization(
          supportedLocales: const <Locale>[
            Locale('es', ''),
          ],
          path: 'assets/translations',
          fallbackLocale: const Locale('es'),
          child: const MyApp(),
        ),
      );
    },
    (e, s) => log(
      'RunZonedGuarded',
      error: e,
      stackTrace: s,
    ),
  );
}
