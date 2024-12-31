import 'package:flutter/material.dart';
import 'package:quran_daily/domain/entities/ayah.dart';

class AyahCard extends StatelessWidget {
  final Ayah ayah;

  const AyahCard({
    super.key,
    required this.ayah,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ayah ${ayah.number}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                IconButton(
                  icon: Icon(
                    ayah.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  ),
                  onPressed: () {
                    
                  },
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              ayah.text,
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'Amiri',
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 8),
            Text(
              ayah.banglaTranslation,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              ayah.banglaPronunciation,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}