import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_daily/core/errors/failures.dart';
import 'package:quran_daily/core/usecase/usecase.dart';
import 'package:quran_daily/features/quran/domain/repositories/quran_repositories.dart';

class SetBookmarkParams extends Equatable {
  final int surahNumber;
  final int ayahNumber;
  final String surahName;

  const SetBookmarkParams({
    required this.surahNumber,
    required this.ayahNumber,
    required this.surahName,
  });

  @override
  List<Object?> get props => [surahNumber, ayahNumber, surahName];
}

class SetBookmark implements UseCase<void, SetBookmarkParams> {
  final QuranRepository repository;

  SetBookmark(this.repository);

  @override
  Future<Either<Failure, void>> call(SetBookmarkParams params) async {
    return await repository.setBookmark(params.surahNumber, params.ayahNumber);
  }
}