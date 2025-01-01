import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:quran_daily/data/models/surah_details_model.dart';
import 'package:quran_daily/presentation/base/base_page.dart';
import 'package:quran_daily/presentation/pages/surah_detail_page/bloc/surah_detail_bloc.dart';
import 'package:quran_daily/presentation/pages/surah_detail_page/widgets/ayah_card.dart';

class SurahDetailPage extends StatelessWidget {
  final int surahNumber;
  final SurahDetailBloc surahDetailBloc = KiwiContainer().resolve<SurahDetailBloc>();

  SurahDetailPage({super.key, required this.surahNumber}) {
    surahDetailBloc.add(LoadSurahDetailEvent(surahNumber));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurahDetailBloc, SurahDetailState>(
      bloc: surahDetailBloc,
      listener: (context, state) {
        if (state is SurahDetailError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.message}')),
          );
        }
      },
      builder: (context, state) {
        return BasePage(
          title: state is SurahDetailLoaded 
            ? state.surahDetailsModel.englishName 
            : 'Loading...',
          showBackButton: true,
          body: Builder(
            builder: (context) {
              if (state is SurahDetailLoading) {
                return const Center(child: CircularProgressIndicator(
                  color: Color(0xFF1F4C6B),
                ));
              } else if (state is SurahDetailError) {
                return Center(child: Text('Error: ${state.message}'));
              } else if (state is SurahDetailLoaded) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: _buildSurahHeader(state.surahDetailsModel),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => AyahCard(
                          ayah: state.surahDetailsModel.ayahs[index],
                        ),
                        childCount: state.surahDetailsModel.ayahs.length,
                      ),
                    ),
                  ],
                );
              }
              return const Center(child: Text('Unexpected state'));
            },
          ),
        );
      },
    );
  }

  Widget _buildSurahHeader(SurahDetailsModel surah) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1F4C6B),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
            ),
            child: Center(
              child: Text(
                surah.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Amiri',
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            surah.englishName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            surah.englishNameTranslation,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          _buildInfoRow('Revelation Type', surah.revelationType, Icons.history),
          _buildInfoRow('Number of Verses', '${surah.numberOfAyahs}', 
            Icons.format_list_numbered),
          _buildInfoRow('Surah Number', '${surah.number}', Icons.bookmark),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.white.withOpacity(0.7), size: 20),
          const SizedBox(width: 12),
          Text(
            '$label:',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}