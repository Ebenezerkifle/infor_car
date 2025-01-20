import 'package:flutter/material.dart';
import 'package:infor_car/app/app.bottomsheets.dart';
import 'package:infor_car/app/app.dialogs.dart';
import 'package:infor_car/app/app.locator.dart';
import 'package:infor_car/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import 'ui/common/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
    );
  }
}
