part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class SurahsLoaded extends HomeState {
  final List<Surah> surahs;

  SurahsLoaded({required this.surahs});
}

class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}