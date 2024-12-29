import 'package:equatable/equatable.dart';

class BookmarkData extends Equatable {
  final int surahNumber;
  final int ayahNumber;
  final String surahName;
  final DateTime timestamp;

  const BookmarkData({
    required this.surahNumber,
    required this.ayahNumber,
    required this.surahName,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [surahNumber, ayahNumber, surahName, timestamp];
}