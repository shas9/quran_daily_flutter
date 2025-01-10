import 'package:flutter/material.dart';
import 'package:quran_daily/domain/entities/ayah.dart';
import 'package:quran_daily/presentation/common/custom_quran_card.dart';

class AyahCard extends StatelessWidget {
  final Ayah ayah;

  const AyahCard({
    super.key,
    required this.ayah,
  });

  @override
  Widget build(BuildContext context) {
    return CustomQuranCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ayah ${ayah.number}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1F4C6B),
                ),
              ),
              IconButton(
                icon: Icon(
                  ayah.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: const Color(0xFF1F4C6B),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            ayah.text,
            style: const TextStyle(
              fontSize: 28,
              fontFamily: 'Amiri',
              color: Color(0xFF1F4C6B),
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 8),
          Text(
            ayah.banglaPronunciation,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF1F4C6B),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            ayah.banglaTranslation,
            style: const TextStyle(
              fontSize: 14,
              color: Color.fromARGB(255, 75, 96, 110),
            ),
          ),
        ],
      ),
    );
  }
}
