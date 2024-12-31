import 'package:equatable/equatable.dart';
import 'package:quran_daily/core/usecase/usecase.dart';
import 'package:quran_daily/domain/repositories/home_repository.dart';

class SetBookmark implements UseCase<void, SetBookmarkParams> {
  final HomeRepository repository;

  SetBookmark(this.repository);

  @override
  Future<void> call(SetBookmarkParams params) async {
    throw UnimplementedError();
    // return repository.setBookmark(params.surahNumber, params.ayahNumber);
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