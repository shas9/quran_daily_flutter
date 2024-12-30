import 'package:equatable/equatable.dart';
import 'package:quran_daily/data/models/ayah_model.dart';

class Ayah extends Equatable {
  final int number;
  final String text;
  final String banglaTranslation;
  final String banglaPronunciation;
  final bool isBookmarked;

  const Ayah({
    required this.number,
    required this.text,
    required this.banglaTranslation,
    required this.banglaPronunciation,
    this.isBookmarked = false,
  });

  @override
  List<Object?> get props => [
        number,
        text,
        banglaTranslation,
        banglaPronunciation,
        isBookmarked,
      ];

  Ayah copyWith({
    int? number,
    String? text,
    String? banglaTranslation,
    String? banglaPronunciation,
    bool? isBookmarked,
  }) {
    return Ayah(
      number: number ?? this.number,
      text: text ?? this.text,
      banglaTranslation: banglaTranslation ?? this.banglaTranslation,
      banglaPronunciation: banglaPronunciation ?? this.banglaPronunciation,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}