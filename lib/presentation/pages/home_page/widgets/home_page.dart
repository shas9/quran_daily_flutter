import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:quran_daily/domain/entities/surah.dart';
import 'package:quran_daily/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:quran_daily/presentation/pages/home_page/widgets/search_bar.dart';
import 'package:quran_daily/presentation/pages/home_page/widgets/surah_list_tile.dart';

class HomePage extends StatelessWidget {
  final HomeBloc homeBloc = KiwiContainer().resolve<HomeBloc>();

  HomePage({super.key}) {
    homeBloc.add(LoadSurahs());
  }

  @override
  Widget build(BuildContext context) {
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
            child: BlocConsumer<HomeBloc, HomeState>(
              bloc: homeBloc,
              listener: (context, state) { },
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const Center(child: CircularProgressIndicator(color: Colors.black,));
                } else if (state is SurahsLoaded) {
                  return ListView.builder(
                    itemCount: state.surahs.length,
                    itemBuilder: (context, index) {
                      final surah = state.surahs[index];
                      return SurahListTile(surah: surah, homeBloc: homeBloc,);
                    },
                  );
                } else if (state is HomeErrorState) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}