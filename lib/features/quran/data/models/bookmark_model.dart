import 'package:quran_daily/features/quran/domain/entities/bookmark_data.dart';

class BookmarkModel extends BookmarkData {
  const BookmarkModel({
    required super.surahNumber,
    required super.ayahNumber,
    required super.surahName,
    required super.timestamp,
  });

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      surahNumber: json['surahNumber'],
      ayahNumber: json['ayahNumber'],
      surahName: json['surahName'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'surahNumber': surahNumber,
      'ayahNumber': ayahNumber,
      'surahName': surahName,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}