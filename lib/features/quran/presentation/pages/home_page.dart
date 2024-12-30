import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_daily/features/quran/domain/entities/surah.dart';
import 'package:quran_daily/features/quran/presentation/bloc/quran_bloc.dart';
import 'package:quran_daily/features/quran/presentation/widgets/search_bar.dart';
import 'package:quran_daily/features/quran/presentation/widgets/surah_list_tile.dart';

class HomePage extends StatelessWidget {
  final QuranBloc quranBloc = QuranBloc();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
  final QuranBloc quranBloc = QuranBloc();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quran Daily'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: CustomSearchBar(),
          ),
          Expanded(
            child: BlocConsumer<QuranBloc, QuranState>(
              bloc: quranBloc,
              listener: (context, state) { },
              builder: (context, state) {
                if (state is QuranLoading) {
                  return const Center(child: CircularProgressIndicator(color: Colors.black,));
                } else if (state is SurahsLoaded) {
                  return ListView.builder(
                    itemCount: state.surahs.length,
                    itemBuilder: (context, index) {
                      final surah = state.surahs[index];
                      return SurahListTile(surah: surah, quranBloc: quranBloc,);
                    },
                  );
                } else if (state is QuranError) {
                  return Center(child: Text(state.message));
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SurahListTile(surah: Surah.generateDummy(), quranBloc: quranBloc,),
                      SurahListTile(surah: Surah.generateDummy(), quranBloc: quranBloc,),
                      SurahListTile(surah: Surah.generateDummy(), quranBloc: quranBloc,),
                      SurahListTile(surah: Surah.generateDummy(), quranBloc: quranBloc,),
                      SurahListTile(surah: Surah.generateDummy(), quranBloc: quranBloc,),
                      SurahListTile(surah: Surah.generateDummy(), quranBloc: quranBloc,),
                      SurahListTile(surah: Surah.generateDummy(), quranBloc: quranBloc,),
                      SurahListTile(surah: Surah.generateDummy(), quranBloc: quranBloc,),
                      SurahListTile(surah: Surah.generateDummy(), quranBloc: quranBloc,),
                      SurahListTile(surah: Surah.generateDummy(), quranBloc: quranBloc,),
                      SurahListTile(surah: Surah.generateDummy(), quranBloc: quranBloc,),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}