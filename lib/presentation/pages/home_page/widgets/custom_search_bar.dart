import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onChanged;
  final String hintText;

  const CustomSearchBar({
    super.key,
    required this.onChanged,
    this.hintText = 'Search Surah...',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF1F4C6B).withOpacity(0.05),
              const Color(0xFF1F4C6B).withOpacity(0.1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFF1F4C6B).withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1F4C6B).withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          onChanged: onChanged,
          style: const TextStyle(
            color: Color(0xFF1F4C6B),
            fontSize: 16,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: const Color(0xFF1F4C6B).withOpacity(0.5),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: const Color(0xFF1F4C6B).withOpacity(0.7),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
          cursorColor: const Color(0xFF1F4C6B),
        ),
      ),
    );
  }
}