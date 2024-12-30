part of 'quran_bloc.dart';

abstract class QuranEvent {}

class LoadSurahs extends QuranEvent {}

class LoadAyahs extends QuranEvent {
  final int surahNumber;
  LoadAyahs({required this.surahNumber});
}

class SetAyahBookmark extends QuranEvent {
  final int surahNumber;
  final int ayahNumber;
  SetAyahBookmark({required this.surahNumber, required this.ayahNumber});
}

class LoadLastBookmark extends QuranEvent {}

class SearchSurah extends QuranEvent {
  final String query;
  SearchSurah({required this.query});
}