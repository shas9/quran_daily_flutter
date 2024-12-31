import 'package:quran_daily/data/models/ayah_model.dart';

class SurahDetailsModel {
  final int number;
  final String name;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final int numberOfAyahs;
  final List<AyahModel> ayahs;

  SurahDetailsModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.numberOfAyahs,
    required this.ayahs,
  });

  factory SurahDetailsModel.fromJson(Map<String, dynamic> json) {
    return SurahDetailsModel(
      number: json['number'],
      name: json['name'],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      revelationType: json['revelationType'],
      numberOfAyahs: json['numberOfAyahs'],
      ayahs: (json['ayahs'] as List)
          .map((ayahJson) => AyahModel.fromJson(ayahJson))
          .toList(),
    );
  }
}