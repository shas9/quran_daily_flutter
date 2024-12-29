part of 'quran_bloc.dart';

abstract class QuranState {}

class QuranInitial extends QuranState {}

class QuranLoading extends QuranState {}

class QuranError extends QuranState {
  final String message;
  QuranError({required this.message});
}

class SurahsLoaded extends QuranState {
  final List<Surah> surahs;
  SurahsLoaded({required this.surahs});
}

class AyahsLoaded extends QuranState {
  final List<Ayah> ayahs;
  AyahsLoaded({required this.ayahs});
}

class BookmarkSet extends QuranState {}

class LastBookmarkLoaded extends QuranState {
  final BookmarkData bookmark;
  LastBookmarkLoaded({required this.bookmark});
}