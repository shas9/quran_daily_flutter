import 'package:dartz/dartz.dart';
import 'package:quran_daily/core/errors/failures.dart';
import 'package:quran_daily/core/usecase/usecase.dart';
import 'package:quran_daily/domain/entities/bookmark_data.dart';
import 'package:quran_daily/domain/repositories/quran_repositories.dart';

class GetLastBookmark implements UseCase<BookmarkData, dynamic> {
  final QuranRepository repository;

  GetLastBookmark(this.repository);

  @override
  Future<Either<Failure, BookmarkData>> call(dynamic params) async {
    return await repository.getLastBookmark();
  }
} 