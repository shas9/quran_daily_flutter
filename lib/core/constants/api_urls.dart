class ApiUrls {
  static const String baseUrl = 'http://api.alquran.cloud/v1';
  
  // Surah endpoints
  static String getAllSurahs() => '$baseUrl/surah';
  static String getSurahDetails(int surahNumber) => '$baseUrl/surah/$surahNumber';
  
  // Ayah endpoints
  static String getAyahBySurah(int surahNumber) => '$baseUrl/surah/$surahNumber/bangla';
  static String getAyahTranslation(int surahNumber) => '$baseUrl/surah/$surahNumber/bn.bengali';
  static String getAyahPronunciation(int surahNumber) => '$baseUrl/surah/$surahNumber/bn.pronunciation';
}
