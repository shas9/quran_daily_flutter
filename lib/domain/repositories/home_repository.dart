import 'package:quran_daily/core/errors/exceptions.dart';
import 'package:quran_daily/core/errors/failures.dart';
import 'package:quran_daily/data/datasources/home/home_remote_data_source.dart';
import 'package:quran_daily/domain/entities/surah.dart';

abstract class HomeRepository {
  Future<List<Surah>> getSurahs();
}

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Surah>> getSurahs() async {
    try {
      final surahs = await remoteDataSource.getSurahs();
      return surahs;
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (e) {
      throw const ServerFailure('An unexpected error occurred');
    }
  }

  // @override
  // Future<List<Ayah>> getAyahsBySurah(int surahNumber) async {
  //   try {
  //     final ayahs = await remoteDataSource.getAyahsBySurah(surahNumber);
      
  //     // Merge with bookmarks
  //     try {
  //       final bookmark = await localDataSource.getLastBookmark();
  //       if (bookmark.surahNumber == surahNumber) {
  //         final index = ayahs.indexWhere((ayah) => ayah.number == bookmark.ayahNumber);
  //         if (index != -1) {
  //           ayahs[index] = ayahs[index].copyWith(isBookmarked: true);
  //         }
  //       }
  //     } catch (e) {
  //       // Ignore bookmark errors
  //     }
      
  //     return ayahs;
  //   } on ServerException catch (e) {
  //     throw ServerFailure(e.message);
  //   } catch (e) {
  //     throw const ServerFailure('An unexpected error occurred');
  //   }
  // }

  // @override
  // void setBookmark(int surahNumber, int ayahNumber) async {
  //   try {
  //     final bookmark = BookmarkModel(
  //       surahNumber: surahNumber,
  //       ayahNumber: ayahNumber,
  //       surahName: '', // You'll need to pass this from the UI
  //       timestamp: DateTime.now(),
  //     );
  //     await localDataSource.saveBookmark(bookmark);
  //     return;
  //   } catch (e) {
  //     throw const CacheFailure('Failed to save bookmark');
  //   }
  // }

  // @override
  // Future<BookmarkData> getLastBookmark() async {
  //   try {
  //     final bookmark = await localDataSource.getLastBookmark();
  //     return bookmark;
  //   } catch (e) {
  //     throw const CacheFailure('No bookmark found');
  //   }
  // }
}