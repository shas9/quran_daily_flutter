import 'package:quran_daily/domain/entities/surah.dart';

class SurahModel extends Surah {
  const SurahModel({
    required super.number,
    required super.arabicName,
    required super.nativeName,
    required super.nativeTitle,
    required super.numberOfAyahs,
    required super.revelationType,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      number: json['number'],
      arabicName: json['name'],
      nativeName: json['englishName'],
      nativeTitle: json['englishNameTranslation'],
      numberOfAyahs: json['numberOfAyahs'],
      revelationType: json['revelationType'],
    );
  }
}