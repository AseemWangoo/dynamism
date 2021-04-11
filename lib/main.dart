import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_theme/app_theme.dart' show AppTheme;

import 'package:screener/fringilla/view_models/fringilla.viewmodel.dart';
import 'package:screener/pellen/view_models/pellen.viewmodel.dart';

import 'home/view_models/home.viewmodel.dart';
import 'locator.dart';
import 'shared/routes/routes.dart';
import 'shared/services/navigation.service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INIT SERVICE LOCATOR
  setupLocator();

  // CALL INIT APIS
  final homeViewModel = locator<HomeViewModel>();
  await homeViewModel.fetchData();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => homeViewModel),
        ChangeNotifierProvider.value(value: PellenViewModel()),
        ChangeNotifierProvider(create: (_) => FringillaViewModel()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final navigatorService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorService.rootNavKey,
      title: 'Screener',
      onGenerateRoute: AppRoutes.generateRoute,
      theme: AppTheme.theme,
    );
  }
}
