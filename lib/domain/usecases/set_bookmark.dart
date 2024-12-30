import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_daily/core/errors/failures.dart';
import 'package:quran_daily/core/usecase/usecase.dart';
import 'package:quran_daily/domain/repositories/quran_repositories.dart';

class SetBookmark implements UseCase<void, SetBookmarkParams> {
  final QuranRepository repository;

  SetBookmark(this.repository);

  @override
  Future<Either<Failure, void>> call(SetBookmarkParams params) async {
    return await repository.setBookmark(params.surahNumber, params.ayahNumber);
  }
}

class SetBookmarkParams extends Equatable {
  final int surahNumber;
  final int ayahNumber;

  const SetBookmarkParams({
    required this.surahNumber,
    required this.ayahNumber,
  });

  @override
  List<Object?> get props => [surahNumber, ayahNumber];
} 