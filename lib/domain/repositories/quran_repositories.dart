import 'package:dartz/dartz.dart';
import 'package:quran_daily/core/errors/exceptions.dart';
import 'package:quran_daily/core/errors/failures.dart';
import 'package:quran_daily/data/datasources/bookmark_local_data_source.dart';
import 'package:quran_daily/data/datasources/quran_remote_data_source.dart';
import 'package:quran_daily/data/models/bookmark_model.dart';
import 'package:quran_daily/domain/entities/ayah.dart';
import 'package:quran_daily/domain/entities/bookmark_data.dart';
import 'package:quran_daily/domain/entities/surah.dart';

abstract class QuranRepository {
  Future<Either<Failure, List<Surah>>> getSurahs();
  Future<Either<Failure, List<Ayah>>> getAyahsBySurah(int surahNumber);
  Future<Either<Failure, void>> setBookmark(int surahNumber, int ayahNumber);
  Future<Either<Failure, BookmarkData>> getLastBookmark();
}

class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDataSource remoteDataSource;
  final BookmarkLocalDataSource localDataSource;

  QuranRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Surah>>> getSurahs() async {
    try {
      final surahs = await remoteDataSource.getSurahs();
      return Right(surahs);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, List<Ayah>>> getAyahsBySurah(int surahNumber) async {
    try {
      final ayahs = await remoteDataSource.getAyahsBySurah(surahNumber);
      
      // Merge with bookmarks
      try {
        final bookmark = await localDataSource.getLastBookmark();
        if (bookmark.surahNumber == surahNumber) {
          final index = ayahs.indexWhere((ayah) => ayah.number == bookmark.ayahNumber);
          if (index != -1) {
            ayahs[index] = ayahs[index].copyWith(isBookmarked: true);
          }
        }
      } catch (e) {
        // Ignore bookmark errors
      }
      
      return Right(ayahs);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, void>> setBookmark(int surahNumber, int ayahNumber) async {
    try {
      final bookmark = BookmarkModel(
        surahNumber: surahNumber,
        ayahNumber: ayahNumber,
        surahName: '', // You'll need to pass this from the UI
        timestamp: DateTime.now(),
      );
      await localDataSource.saveBookmark(bookmark);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to save bookmark'));
    }
  }

  @override
  Future<Either<Failure, BookmarkData>> getLastBookmark() async {
    try {
      final bookmark = await localDataSource.getLastBookmark();
      return Right(bookmark);
    } catch (e) {
      return Left(CacheFailure('No bookmark found'));
    }
  }
}