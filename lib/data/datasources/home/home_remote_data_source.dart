import 'package:quran_daily/core/api/api_call.dart';
import 'package:quran_daily/core/constants/api_urls.dart';
import 'package:quran_daily/core/errors/exceptions.dart';
import 'package:quran_daily/core/network/dio_client.dart';
import 'package:quran_daily/data/models/ayah_model.dart';
import 'package:quran_daily/data/models/surah_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<SurahModel>> getSurahs();
  // Future<List<AyahModel>> getAyahsBySurah(int surahNumber);
}


class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient dioClient;

  HomeRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<SurahModel>> getSurahs() async {
    try {
      final response = await apiCall(() => dioClient.get(ApiUrls.getAllSurahs()));

      if (response.isSuccess && response.data != null) {
        final List<dynamic> surahsData = response.data['data'];
        return surahsData.map((surah) => SurahModel.fromJson(surah)).toList();
      } else {
        throw ServerException(response.error ?? 'Failed to load surahs');
      }
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<List<AyahModel>> getAyahsBySurah(int surahNumber) async {
  //   // Get Arabic text
  //   final arabicResponse = await apiCall(
  //     () => dioClient.get(ApiUrls.getSurahDetails(surahNumber)),
  //   );

  //   // Get Bangla translation
  //   final translationResponse = await apiCall(
  //     () => dioClient.get(ApiUrls.getAyahTranslation(surahNumber)),
  //   );

  //   // Get Bangla pronunciation
  //   final pronunciationResponse = await apiCall(
  //     () => dioClient.get(ApiUrls.getAyahPronunciation(surahNumber)),
  //   );

  //   // Check if all responses are successful
  //   if (arabicResponse.isSuccess &&
  //       translationResponse.isSuccess &&
  //       pronunciationResponse.isSuccess &&
  //       arabicResponse.data != null &&
  //       translationResponse.data != null &&
  //       pronunciationResponse.data != null) {
      
  //     final List<dynamic> arabicAyahs = arabicResponse.data['data']['ayahs'];
  //     final List<dynamic> translationAyahs = translationResponse.data['data']['ayahs'];
  //     final List<dynamic> pronunciationAyahs = pronunciationResponse.data['data']['ayahs'];

  //     // Validate array lengths match
  //     if (arabicAyahs.length != translationAyahs.length ||
  //         arabicAyahs.length != pronunciationAyahs.length) {
  //       throw ServerException('Inconsistent ayah data received from server');
  //     }

  //     List<AyahModel> ayahs = [];
      
  //     for (int i = 0; i < arabicAyahs.length; i++) {
  //       try {
  //         ayahs.add(AyahModel(
  //           number: arabicAyahs[i]['numberInSurah'],
  //           text: arabicAyahs[i]['text'],
  //           banglaTranslation: translationAyahs[i]['text'],
  //           banglaPronunciation: pronunciationAyahs[i]['text'],
  //         ));
  //       } catch (e) {
  //         throw ServerException('Error parsing ayah data: ${e.toString()}');
  //       }
  //     }

  //     return ayahs;
  //   } else {
  //     // Combine error messages if multiple requests failed
  //     final errors = [
  //       if (!arabicResponse.isSuccess) 'Arabic text: ${arabicResponse.error}',
  //       if (!translationResponse.isSuccess) 'Translation: ${translationResponse.error}',
  //       if (!pronunciationResponse.isSuccess) 'Pronunciation: ${pronunciationResponse.error}',
  //     ].join(', ');

  //     throw ServerException('Failed to load ayahs: $errors');
  //   }
  // }
}