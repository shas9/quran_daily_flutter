part of 'home_bloc.dart';

abstract class HomeEvent {}

class LoadSurahs extends HomeEvent {}

class SearchSurah extends HomeEvent {
  final String query;

  SearchSurah(this.query);
}