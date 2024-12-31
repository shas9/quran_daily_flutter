import 'package:quran_daily/core/usecase/usecase.dart';
import 'package:quran_daily/domain/entities/bookmark_data.dart';
import 'package:quran_daily/domain/repositories/home_repository.dart';

class GetLastBookmark implements UseCase<BookmarkData, dynamic> {
  final HomeRepository repository;

  GetLastBookmark(this.repository);

  @override
  Future<BookmarkData> call(dynamic params) async {
    throw UnimplementedError();
    // return await repository.getLastBookmark();
  }
} 