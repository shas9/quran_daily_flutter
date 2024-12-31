import 'package:equatable/equatable.dart';
import 'package:quran_daily/core/usecase/usecase.dart';
import 'package:quran_daily/domain/entities/ayah.dart';
import 'package:quran_daily/domain/repositories/home_repository.dart';

class GetAyahs implements UseCase<List<Ayah>, GetAyahsParams> {
  final HomeRepository repository;

  GetAyahs(this.repository);

  @override
  Future<List<Ayah>> call(GetAyahsParams params) async {
    throw UnimplementedError();
    // return await repository.getAyahsBySurah(params.surahNumber);
  }
}

class GetAyahsParams extends Equatable {
  final int surahNumber;

  const GetAyahsParams({required this.surahNumber});

  @override
  List<Object?> get props => [surahNumber];
} 