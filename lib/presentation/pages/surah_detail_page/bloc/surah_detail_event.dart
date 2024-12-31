part of 'surah_detail_bloc.dart';

sealed class SurahDetailEvent {}

class LoadSurahDetailEvent extends SurahDetailEvent {
  final int surahNumber;

  LoadSurahDetailEvent(this.surahNumber);
}
