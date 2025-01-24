import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:serasa/di/dependency_injection.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:serasa/shared/app_routes/paths.dart';
import 'package:serasa/shared/app_routes/routes.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  DependencyInjector().setup();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Future.delayed(const Duration(seconds: 2));
  
  runApp(
    MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: GetInformationParser(),
      routerDelegate: GetDelegate(
        preventDuplicateHandlingMode: PreventDuplicateHandlingMode.DoNothing,
      ),
      builder: (context, child) {
        FlutterNativeSplash.remove();

        return GetMaterialApp(
          getPages: Routes.pages,
          initialRoute: Paths.homePage,
          debugShowCheckedModeBanner: false,
          builder: (context, child) => child!,
          localizationsDelegates: const [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('pt')],
        );
      },
    ),
  );
}
