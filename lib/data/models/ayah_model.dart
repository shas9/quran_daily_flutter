import 'package:quran_daily/domain/entities/ayah.dart';

class AyahModel extends Ayah {
  const AyahModel({
    required super.number,
    required super.text,
    required super.banglaTranslation,
    required super.banglaPronunciation,
    super.isBookmarked,
  });

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      number: json['numberInSurah'] ?? json['number'],
      text: json['text'],
      banglaTranslation: json['translation'] ?? '',
      banglaPronunciation: json['pronunciation'] ?? '',
      isBookmarked: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'text': text,
      'translation': banglaTranslation,
      'pronunciation': banglaPronunciation,
      'isBookmarked': isBookmarked,
    };
  }

  factory AyahModel.fromEntity(Ayah entity) {
    return AyahModel(
      number: entity.number,
      text: entity.text,
      banglaTranslation: entity.banglaTranslation,
      banglaPronunciation: entity.banglaPronunciation,
      isBookmarked: entity.isBookmarked,
    );
  }

  // in AyahModel class
  @override
  AyahModel copyWith({
    int? number,
    String? text,
    String? banglaTranslation,
    String? banglaPronunciation,
    bool? isBookmarked,
  }) {
    return AyahModel(
      number: number ?? this.number,
      text: text ?? this.text,
      banglaTranslation: banglaTranslation ?? this.banglaTranslation,
      banglaPronunciation: banglaPronunciation ?? this.banglaPronunciation,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
