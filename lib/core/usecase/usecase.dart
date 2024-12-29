import 'package:dartz/dartz.dart';
import 'package:quran_daily/core/errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}