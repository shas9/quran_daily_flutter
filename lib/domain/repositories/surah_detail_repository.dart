import 'package:quran_daily/core/errors/exceptions.dart';
import 'package:quran_daily/core/errors/failures.dart';
import 'package:quran_daily/data/datasources/surah_detail/surah_detail_remote_data_source.dart';
import 'package:quran_daily/data/models/surah_details_model.dart';

abstract class SurahDetailRepository {
  Future<SurahDetailsModel> getDetailsModelBySurah(int surahNumber);
}

class SurahDetailRepositoryImpl implements SurahDetailRepository {
  final SurahDetailRemoteDataSource remoteDataSource;

  SurahDetailRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<SurahDetailsModel> getDetailsModelBySurah(int surahNumber) async {
     try {
      final surahs = await remoteDataSource.getDetailsModelBySurah(surahNumber);
      return surahs;
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw const ServerFailure('An unexpected error occurred');
    }
  }
}