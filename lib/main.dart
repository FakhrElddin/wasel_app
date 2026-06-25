import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasel_app/config/app_routes.dart';
import 'package:wasel_app/config/app_theme.dart';
import 'package:wasel_app/core/cache/shared_prefs_utils.dart';
import 'package:wasel_app/core/di/di.dart';
import 'package:wasel_app/core/utils/my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtils.init();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const WaselApp());
}

class WaselApp extends StatelessWidget {
  const WaselApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.splashScreenRoute,
    );
  }
}
