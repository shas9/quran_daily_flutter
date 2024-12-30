import 'package:equatable/equatable.dart';

class Surah extends Equatable {
  final int number;
  final String arabicName;
  final String nativeName;
  final String nativeTitle;
  final int numberOfAyahs;
  final String revelationType;

  const Surah({
    required this.number,
    required this.arabicName,
    required this.nativeName,
    required this.nativeTitle,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  // Static method to generate a dummy Surah
  static Surah generateDummy() {
    return const Surah(
      number: 1,
      arabicName: 'الفاتحة',
      nativeName: 'Al-Fatiha',
      nativeTitle: 'The Opening',
      numberOfAyahs: 7,
      revelationType: 'Meccan',
    );
  }

  @override
  List<Object?> get props => [
        number,
        arabicName,
        nativeName,
        nativeTitle,
        numberOfAyahs,
        revelationType,
      ];
}
