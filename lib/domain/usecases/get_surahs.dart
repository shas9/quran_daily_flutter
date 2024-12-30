import 'package:dartz/dartz.dart';
import 'package:quran_daily/core/errors/failures.dart';
import 'package:quran_daily/core/usecase/usecase.dart';
import 'package:quran_daily/domain/entities/surah.dart';
import 'package:quran_daily/domain/repositories/quran_repositories.dart';

class GetSurahs implements UseCase<List<Surah>, dynamic> {
  final QuranRepository repository;

  GetSurahs(this.repository);

  @override
  Future<Either<Failure, List<Surah>>> call(dynamic params) async {
    return await repository.getSurahs();
  }
} 