import 'package:flutter/material.dart';
import 'package:quran_daily/presentation/pages/home_page/widgets/home_page.dart';
import 'package:quran_daily/services/service_container.dart';

void main() {
  ServiceContainer.setup();
  runApp(const QuranDailyApp());
}

class QuranDailyApp extends StatelessWidget {
  const QuranDailyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}
