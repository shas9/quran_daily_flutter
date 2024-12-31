part of 'surah_detail_bloc.dart';

sealed class SurahDetailState {}

final class SurahDetailInitial extends SurahDetailState {}

final class SurahDetailLoading extends SurahDetailState {}
final class SurahDetailLoaded extends SurahDetailState {
  final SurahDetailsModel surahDetailsModel;

  SurahDetailLoaded(this.surahDetailsModel);
}
final class SurahDetailError extends SurahDetailState {
  final String message;

  SurahDetailError(this.message);
}
