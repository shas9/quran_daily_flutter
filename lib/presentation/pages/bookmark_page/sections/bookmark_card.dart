import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quran_daily/presentation/common/custom_quran_card.dart';

class BookmarkCard extends StatelessWidget {
  const BookmarkCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomQuranCard(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          // Navigate to ayah
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Ayah 255',
                    style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey[600],
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ',
              style: TextStyle(
                color: Color(0xFF1F4C6B),
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: 'Amiri'
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 8),
            const Text(
              'In the name of Allah, the Most Gracious, the Most Merciful',
              style: TextStyle(
                color: Color(0xFF1F4C6B),
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
