import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_daily/core/errors/failures.dart';
import 'package:quran_daily/core/usecase/usecase.dart';
import 'package:quran_daily/domain/entities/ayah.dart';
import 'package:quran_daily/domain/repositories/quran_repositories.dart';

class GetAyahs implements UseCase<List<Ayah>, GetAyahsParams> {
  final QuranRepository repository;

  GetAyahs(this.repository);

  @override
  Future<Either<Failure, List<Ayah>>> call(GetAyahsParams params) async {
    return await repository.getAyahsBySurah(params.surahNumber);
  }
}

class GetAyahsParams extends Equatable {
  final int surahNumber;

  const GetAyahsParams({required this.surahNumber});

  @override
  List<Object?> get props => [surahNumber];
} 