import 'package:flutter/material.dart';
import 'package:quran_daily/domain/entities/ayah.dart';
import 'package:quran_daily/domain/entities/surah.dart';
import 'package:quran_daily/presentation/pages/surah_detail_page/widgets/ayah_card.dart';

class SurahDetailPage extends StatelessWidget {
  final Surah surah;

  const SurahDetailPage({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.nativeName),
      ),
      body: FutureBuilder(
        future: _fetchAyahs(surah.number), // Replace with your data fetching method
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final ayahs = snapshot.data as List<Ayah>;
            return ListView.builder(
              itemCount: ayahs.length,
              itemBuilder: (context, index) {
                final ayah = ayahs[index];
                return AyahCard(
                  ayah: ayah,
                  surahNumber: surah.number,
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Future<List<Ayah>> _fetchAyahs(int surahNumber) async {
    // Dummy data for demonstration
    return Future.value([
      const Ayah(
        number: 1,
        text: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
        banglaTranslation: 'পরম করুণাময়, অতি দয়ালু আল্লাহর নামে শুরু করছি।',
        banglaPronunciation: 'Bismillahir Rahmanir Rahim',
      ),
      const Ayah(
        number: 2,
        text: 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
        banglaTranslation: 'সকল প্রশংসা বিশ্বজগতের প্রতিপালক আল্লাহর।',
        banglaPronunciation: 'Alhamdu lillahi rabbil alamin',
      ),
      const Ayah(
        number: 3,
        text: 'الرَّحْمَٰنِ الرَّحِيمِ',
        banglaTranslation: 'যিনি পরম করুণাময়, অতি দয়ালু।',
        banglaPronunciation: 'Ar-Rahmanir-Rahim',
      ),
    ]);
  }
}
