import 'package:flutter/material.dart';
import 'package:quran_daily/core/router/app_router.dart';
import 'package:quran_daily/services/service_container.dart';

void main() {
  ServiceContainer.setup();
  runApp(const QuranDailyApp());
}

class QuranDailyApp extends StatelessWidget {
  const QuranDailyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
    );
  }
}
