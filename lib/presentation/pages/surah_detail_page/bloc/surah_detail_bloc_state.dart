part of 'surah_detail_bloc_bloc.dart';

sealed class SurahDetailBlocState extends Equatable {
  const SurahDetailBlocState();
  
  @override
  List<Object> get props => [];
}

final class SurahDetailBlocInitial extends SurahDetailBlocState {}
