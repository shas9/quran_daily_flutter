import 'package:flutter/material.dart';
import 'package:quran_daily/presentation/base/base_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(title: 'Settings', showBackButton: true, body: SizedBox());
  }
}