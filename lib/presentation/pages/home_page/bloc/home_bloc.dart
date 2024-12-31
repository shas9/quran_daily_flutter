import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_daily/domain/entities/surah.dart';
import 'package:quran_daily/domain/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<LoadSurahs>(_onLoadSurahs);
    on<SearchSurah>(_onSearchSurah);
  }

  void _onLoadSurahs(LoadSurahs event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      final surahs = await homeRepository.getSurahs();
      emit(SurahsLoaded(surahs: surahs));
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }

  void _onSearchSurah(SearchSurah event, Emitter<HomeState> emit) {
    if (state is SurahsLoaded) {
      final surahs = (state as SurahsLoaded).surahs;
      final filteredSurahs = surahs
          .where((surah) =>
              surah.arabicName.toLowerCase().contains(event.query.toLowerCase()) ||
              surah.nativeName.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(SurahsLoaded(surahs: filteredSurahs));
    }
  }

  // Future<void> _onLoadAyahs(LoadAyahs event, Emitter<HomeState> emit) async {
  //   emit(HomeLoading());
  //   // final result = await getAyahs(GetAyahsParams(surahNumber: event.surahNumber));
  //   // result.fold(
  //   //   (failure) => emit(HomeError(message: failure.message)),
  //   //   (ayahs) => emit(AyahsLoaded(ayahs: ayahs)),
  //   // );

  //   Future.delayed(const Duration(seconds: 1));

  //   emit(AyahsLoaded(ayahs: []));
  // }

  // Future<void> _onSetBookmark(SetAyahBookmark event, Emitter<HomeState> emit) async {
  //   // final result = await setBookmark(
  //   //   SetBookmarkParams(
  //   //     surahNumber: event.surahNumber,
  //   //     ayahNumber: event.ayahNumber, surahName: '',
  //   //   ),
  //   // );
  //   // result.fold(
  //   //   (failure) => emit(HomeError(message: failure.message)),
  //   //   (_) => emit(BookmarkSet()),
  //   // );
  // }

  // Future<void> _onLoadLastBookmark(LoadLastBookmark event, Emitter<HomeState> emit) async {
  //   emit(HomeLoading());
  //   // final result = await getLastBookmark();
  //   // result.fold(
  //   //   (failure) => emit(HomeError(message: failure.message)),
  //   //   (bookmark) => emit(LastBookmarkLoaded(bookmark: bookmark)),
  //   // );
  // }
}