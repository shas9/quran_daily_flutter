import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_daily/features/quran/domain/entities/surah.dart';
import 'package:quran_daily/features/quran/presentation/bloc/quran_bloc.dart';

class SurahListTile extends StatelessWidget {
  final Surah surah;

  const SurahListTile({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(surah.name),
      subtitle: Text(surah.englishName),
      trailing: Text('${surah.numberOfAyahs} ayahs'),
      onTap: () {
        context.read<QuranBloc>().add(LoadAyahs(surahNumber: surah.number));
        // Navigate to surah detail page
      },
    );
  }
} 