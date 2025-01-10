// Enhanced Home Page
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:quran_daily/core/router/app_router.dart';
import 'package:quran_daily/core/router/route_names.dart';
import 'package:quran_daily/presentation/base/base_page.dart';
import 'package:quran_daily/presentation/pages/home_page/bloc/home_bloc.dart';
import 'package:quran_daily/presentation/pages/home_page/widgets/custom_search_bar.dart';
import 'package:quran_daily/presentation/pages/home_page/widgets/surah_list_tile.dart';

class HomePage extends StatelessWidget {
  final HomeBloc homeBloc = KiwiContainer().resolve<HomeBloc>();

  HomePage({super.key}) {
    homeBloc.add(LoadSurahs());
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Quran Daily',
      actions: [
        IconButton(
          icon: const Icon(
            Icons.bookmark_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            AppRouter.navigate(RouteNames.bookmarkPage);
          },
        ),
      ],
      body: Column(
        children: [
          CustomSearchBar(onChanged: (value) {  },),
          Expanded(
            child: BlocConsumer<HomeBloc, HomeState>(
              bloc: homeBloc,
              listener: (context, state) {},
              builder: (context, state) {
                if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF1F4C6B),
                    ),
                  );
                } else if (state is SurahsLoaded) {
                  return ListView.builder(
                    itemCount: state.surahs.length,
                    itemBuilder: (context, index) {
                      return SurahListTile(
                        surah: state.surahs[index],
                        homeBloc: homeBloc,
                      );
                    },
                  );
                } else if (state is HomeErrorState) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Color(0xFF1F4C6B)),
                    ),
                  );
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