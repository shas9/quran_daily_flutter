import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_daily/core/usecase/get_last_bookmark.dart';
import 'package:quran_daily/core/usecase/set_bookmark.dart';
import 'package:quran_daily/features/quran/domain/entities/ayah.dart';
import 'package:quran_daily/features/quran/domain/entities/bookmark_data.dart';
import 'package:quran_daily/features/quran/domain/entities/surah.dart';
import 'package:quran_daily/features/quran/domain/usecases/get_ayahs.dart';
import 'package:quran_daily/features/quran/domain/usecases/get_surahs.dart';

part 'quran_event.dart';
part 'quran_state.dart';

class QuranBloc extends Bloc<QuranEvent, QuranState> {
  final GetSurahs getSurahs;
  final GetAyahs getAyahs;
  final SetBookmark setBookmark;
  final GetLastBookmark getLastBookmark;

  QuranBloc({
    required this.getSurahs,
    required this.getAyahs,
    required this.setBookmark,
    required this.getLastBookmark,
  }) : super(QuranInitial()) {
    on<LoadSurahs>(_onLoadSurahs);
    on<LoadAyahs>(_onLoadAyahs);
    on<SetAyahBookmark>(_onSetBookmark);
    on<LoadLastBookmark>(_onLoadLastBookmark);
    on<SearchSurah>(_onSearchSurah);
  }

  Future<void> _onLoadSurahs(LoadSurahs event, Emitter<QuranState> emit) async {
    emit(QuranLoading());
    // final result = await getSurahs();
    // result.fold(
    //   (failure) => emit(QuranError(message: failure.message)),
    //   (surahs) => emit(SurahsLoaded(surahs: surahs)),
    // );
  }

  Future<void> _onLoadAyahs(LoadAyahs event, Emitter<QuranState> emit) async {
    emit(QuranLoading());
    final result = await getAyahs(GetAyahsParams(surahNumber: event.surahNumber));
    result.fold(
      (failure) => emit(QuranError(message: failure.message)),
      (ayahs) => emit(AyahsLoaded(ayahs: ayahs)),
    );
  }

  Future<void> _onSetBookmark(SetAyahBookmark event, Emitter<QuranState> emit) async {
    final result = await setBookmark(
      SetBookmarkParams(
        surahNumber: event.surahNumber,
        ayahNumber: event.ayahNumber, surahName: '',
      ),
    );
    result.fold(
      (failure) => emit(QuranError(message: failure.message)),
      (_) => emit(BookmarkSet()),
    );
  }

  void _onSearchSurah(SearchSurah event, Emitter<QuranState> emit) {
    if (state is SurahsLoaded) {
      final surahs = (state as SurahsLoaded).surahs;
      final filteredSurahs = surahs
          .where((surah) =>
              surah.name.toLowerCase().contains(event.query.toLowerCase()) ||
              surah.englishName.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(SurahsLoaded(surahs: filteredSurahs));
    }
  }

  Future<void> _onLoadLastBookmark(LoadLastBookmark event, Emitter<QuranState> emit) async {
    emit(QuranLoading());
    // final result = await getLastBookmark();
    // result.fold(
    //   (failure) => emit(QuranError(message: failure.message)),
    //   (bookmark) => emit(LastBookmarkLoaded(bookmark: bookmark)),
    // );
  }
}