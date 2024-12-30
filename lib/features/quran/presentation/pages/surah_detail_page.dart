import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_daily/features/quran/domain/entities/surah.dart';
import 'package:quran_daily/features/quran/presentation/bloc/quran_bloc.dart';
import 'package:quran_daily/features/quran/presentation/widgets/ayah_card.dart';

class SurahDetailPage extends StatelessWidget {
  final Surah surah;

  const SurahDetailPage({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(surah.nativeName),
      ),
      body: BlocBuilder<QuranBloc, QuranState>(
        builder: (context, state) {
          if (state is QuranLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AyahsLoaded) {
            return ListView.builder(
              itemCount: state.ayahs.length,
              itemBuilder: (context, index) {
                final ayah = state.ayahs[index];
                return AyahCard(
                  ayah: ayah,
                  surahNumber: surah.number,
                );
              },
            );
          } else if (state is QuranError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}