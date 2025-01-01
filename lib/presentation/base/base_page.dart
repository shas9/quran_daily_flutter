import 'package:flutter/material.dart';

// Base page for consistent theming
class BasePage extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget body;
  final bool showBackButton;

  const BasePage({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F4C6B),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: showBackButton,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: actions,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1F4C6B), Color(0xFF2C6E9B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: body,
    );
  }
}