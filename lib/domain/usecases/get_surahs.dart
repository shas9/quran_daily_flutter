import 'package:quran_daily/core/usecase/usecase.dart';
import 'package:quran_daily/domain/entities/surah.dart';
import 'package:quran_daily/domain/repositories/home_repository.dart';

class GetSurahs implements UseCase<List<Surah>, dynamic> {
  final HomeRepository repository;

  GetSurahs(this.repository);

  @override
  Future<List<Surah>> call(dynamic params) async {
    return await repository.getSurahs();
  }
} 